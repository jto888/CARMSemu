\name{simulate.carms}
\alias{simulate.carms}

\title{
    Generate a simulation of a carms object.
}
\description{
    This function calls for the simulation on a completed carms object.
	}
\usage{
	simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
	}

\arguments{
    \item{x}{
        A completed \code{"carms"} object as initialized by carms.make and modified by previous carms.state, carms.base and carms.arrow calls
	}
	\item{solution}{
		A string of "rk", "bd", or "chain" indicating the method of obtaining the simulation solution. Although not intended for production
		work, it is possible to enter a string of "chain_R" to execute the formative R code for the stochastic chain solution.
	}
	\item{mission_time}{
		A time value for the extent of mission history for the simulation
	}
	\item{intervals}{
		An integer value for the number of intervals over the mission history to calculate the simulation.
	}
	\item{cycles}{
		An integer value (usually in the thousands) impacting the number of simulations run only when using the chain solution.
	}
}

\details{
	It was chosen not to register this functionThis function, due to differences in fundimental arguments with stats::simulate.
	}
	
\value{
	This function returns a matrix of probabilities for each state at each time step to the carms$simulation list element.
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}

\examples{
	SiSimpl<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,8))
	SiSimpl<-carms.state(SiSimpl, prob=1, name="P1", size=7, h2w=14/20, position=c(2,3) )
	SiSimpl<-carms.state(SiSimpl, prob=0, name="P2", size=7, h2w=14/20, position=c(6,3) )	
	SiSimpl<-carms.base(SiSimpl, 1, time_units="hours",  description="Failure rate")
	SiSimpl<-carms.arrow(SiSimpl, from=1, to=2, rate="B1",label="B1")
	SiSimpl<-simulate.carms(SiSimpl, solution="rk", mission_time=200)
}

\name{matP}
\alias{matP}

\title{
    Extract the probability matrix from a completed carms object with a simulation.
}
\description{
    This function extracts the probability matrix from a completed carms object with a simulation.
	}
\usage{matP(x) 
	}

\arguments{
    \item{x}{
        A completed carms object with a simulation.
	}
}

\value{
    A matrix of probabilities for each state at each time step of the simulation.
}

\examples{
	SiSimpl<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,8))
	SiSimpl<-carms.state(SiSimpl, prob=1, name="P1", size=7, h2w=14/20, position=c(2,3) )
	SiSimpl<-carms.state(SiSimpl, prob=0, name="P2", size=7, h2w=14/20, position=c(6,3) )	
	SiSimpl<-carms.base(SiSimpl, 1, time_units="hours",  description="Failure rate")
	SiSimpl<-carms.arrow(SiSimpl, from=1, to=2, rate="B1",label="B1")
	SiSimpl<-simulate(SiSimpl, solution="rk", mission_time=200)
	matP(SiSimpl)
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}

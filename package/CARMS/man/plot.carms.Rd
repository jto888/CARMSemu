\name{plot.carms}
\alias{plot.carms}

\title{
    Deliver a plot of the simulation of a carms object.
}
\description{
    This function delivers a plot of the varying probability of each state over the simulated mission history.
	}
\usage{
	\method{plot}{carms}(x, spline_curve=TRUE, knots=10, ...) 
	}

\arguments{
    \item{x}{
        A completed \code{"carms"} object including a simulation.	}
	\item{spline_curve}{
		A logical determining whether to generate a smoothed spline curve from the simulation data (alternatively line segments from step to step will be displayed).
	}
	\item{knots}{
		An integer value of a fraction of simulation intervals to use for determination of a smoothed spline.
	}
	\item{...}{
		A list argument enabling modification of certain defaults (not yet implemented)
	}	
}

\details{
	This function is specified as an S3 method so can be called as simply plot().
}

\value{
	This function returns a matrix of probabilities for each state at each time step to the carms$simulation list element.
}

\examples{
	SiSimpl<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,8))
	SiSimpl<-carms.state(SiSimpl, prob=1, name="P1", size=7, h2w=14/20, position=c(2,3) )
	SiSimpl<-carms.state(SiSimpl, prob=0, name="P2", size=7, h2w=14/20, position=c(6,3) )	
	SiSimpl<-carms.base(SiSimpl, 1, time_units="hours",  description="Failure rate")
	SiSimpl<-carms.arrow(SiSimpl, from=1, to=2, rate="B1",label="B1")
	SiSimpl<-simulate(SiSimpl, solution="rk", mission_time=200)
	\donttest{
	plot.carms(SiSimpl)
	plot(SiSimpl)
	}
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}


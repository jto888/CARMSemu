\name{simulate}
\alias{simulate}

\title{
    Generate a simulation of a carms object.
}
\description{
    This function calls for the simulation on a completed carms object.
	}
\usage{
	simulate(x, solution, mission_time, intervals=20, cycles=1000)
	}

\arguments{
    \item{x}{
        A completed \code{"carms"} object as initialized by carms.make and modified by previous carms.state, carms.base and carms.arrow calls
	}
	\item{solution}{
		A string of "rk", "bd", or "chain" indicating the method of obtaining the simulation solution.
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
	This function is specified as an S3 method so can be called as simply simulate().
}

\value{
	This function returns a matrix of probabilities for each state at each time step to the carms$simulation list element.
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}


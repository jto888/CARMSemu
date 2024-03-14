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

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}

\examples{
	jeep<-carms.make("jeep    Tire configurations")	
}

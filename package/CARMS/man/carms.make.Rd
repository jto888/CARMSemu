\name{carms.make}
\alias{carms.make}

\title{
    Create a \code{carms} Object for continuous time Markov rate modeling
}
\description{
    This function creates an initial carms object
	}
\usage{carms.make(title=NULL, diagram_grid=c(11,12),...) 
	}

\arguments{
    \item{title}{
        A title that will appear on simulation plot(s)
	}
	\item{diagram_grid}{
		A two element vector defining a grid for placement of state objects (rows, columns)
	}
	\item{...}{
		A list argument enabling modification of certain defaults (not yet implemented)
	}
}

\details{
	This initial carms object is required for the addition of state, base and arrow elements.
}

\value{
    A named list of class \code{"carms"}.
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}

\examples{
	jeep<-carms.make("jeep    Tire configurations")	
}

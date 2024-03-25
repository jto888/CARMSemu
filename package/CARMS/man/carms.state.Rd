\name{carms.state}
\alias{carms.state}

\title{
    Modify an \code{"carms"} Object adding a state element
}
\description{
    This function defines a state with attributes for diagram name, size, proportion and placement in a diagram.
	}
\usage{carms.state(x, prob,  name, size=4, h2w=21/24, position,
		Pfunction=NULL, plot.line.color=NULL,  description="")
	}

\arguments{
    \item{x}{
        An \code{"carms"} object as initialized by carms.make or modified only by previous carms.state calls
	}
	\item{prob}{
		An initial probability. 
	}
	\item{name}{
		A string that will be used to identify the state on a diagram. 
	}
	\item{size}{
		A relative value for the state element often determined by trial and modification of diagram development. 
	}
	\item{h2w}{
		A proportion value for the state element often determined by trial and modification of diagram development. 
	}
	\item{position}{
		A vector of (column, row) related to the diagram grid and often determined by trial and modification of diagram development. 
	}
	\item{Pfunction}{
		A string defining a function providing for an alternative probability determination after simulation, typically accumulating the probabilty values of several other states.
	}
	\item{plot.line.color}{
		A string providing for an override of the default color palatte designation for this particular state on the simulation plot.
	}
	\item{description}{
		A string providing more information about the state (never seen on diagram nor plot).
	}	
}


\value{
	The	input object will be returned with the addition this state information in the \code{"carms$state"} list element.	
}

\examples{
	SiSimpl<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,8))
	SiSimpl<-carms.state(SiSimpl, prob=1, name="P1", size=7, h2w=14/20, position=c(2,3) )
	SiSimpl<-carms.state(SiSimpl, prob=0, name="P2", size=7, h2w=14/20, position=c(6,3) )
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}


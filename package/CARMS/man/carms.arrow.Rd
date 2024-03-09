\name{carms.arrow}
\alias{carms.arrow}

\title{
    Modify an \code{"carms"} Object adding a transition as an arrow element
}
\description{
    This function defines a transition, by attributes of source (from) and destination (to), rate value, connecting arrow arc, position and diagram label.
	}
\usage{carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
	}

\arguments{
    \item{x}{
        An \code{"carms"} object as initialized by carms.make and modified by previous carms.state, carms.base and/or carms.arrow calls
	}
	\item{from}{
		The state number (as determined by order of entry) of the source state for transition. 
	}
	\item{to}{
		The state number (as determined by order of entry) of the destination state for transition. 
	}
	\item{rate}{
		A base label or formula (either as a string or as global environment labels) utilizing base labels. Alternatively, a single value unassigned as a base.
	}
	\item{arc}{
		A convexity/concavity value for the connecting transition arc often determined by trial and modification of diagram development. 
	}
	\item{arrow.position}{
		A value from 0 to 1 for the location of the arrow on a transition arc as well as the transition label often determined by trial and modification of diagram development. 
	}
	\item{label}{
		A string defining the transition often as a rate. The rate and label may often be identical, but they are treated in different ways.
	}	
}


\value{
	The	input object will be returned with the addition this arrow information in the \code{"carms$arrows$arrow"} list element.	
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}


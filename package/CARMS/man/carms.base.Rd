\name{carms.base}
\alias{carms.base}

\title{
    Modify an \code{"carms"} Object adding a base element
}
\description{
    This function establishes a base rate that can be called, often in multiples or combination, during transition definition.
	}
\usage{carms.base(x, value, time_units=NULL, base_label=NULL, description="") 
	}
\arguments{
    \item{x}{
        An \code{"carms"} object as initialized by carms.make and modified only by previous carms.state or carms.base calls
	}
	\item{value}{
		A rate value
	}
	\item{time_units}{
		A string establishing the units of time measure. This value is requried on only the first carms.base call on a carms object. It will be ignored in subsequent carms.base calls.  The units string provided here will be used for the x-axis label of the simulation plot. 
	}
	\item{size}{
		A relative value for the base element often determined by trial and modification of diagram development. 
	}
	\item{base_label}{
		An optional string that can be used as a valid R object name holding this value.
	}
	\item{description}{
		An optional string providing more information about the base (never seen on diagram nor plot).
	}	
}


\value{
	The	input object will be returned with the addition this base information in the \code{"carms$base"} list element.
	Objects will also be added to the global environment as B_, b_ carrying the number of the order of base entries to the carms object.
	Also, any base_label provided will be defined in the global environment as well.
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}

 
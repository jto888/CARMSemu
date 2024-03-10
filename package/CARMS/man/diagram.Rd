\name{diagram}
\alias{diagram}

\title{
    Deliver a Markov diagram display of a carms object.
}
\description{
    This function is simply an alias to diagram.carms since diagram is not avaliable as an S3 method.
	}
\usage{
	diagram(x, text.size=0.7, rate.text.y.shift=0.7,shadow=FALSE )
	}

\arguments{
    \item{x}{
        A \code{"carms"} object as initialized by carms.make and modified by previous carms.state and/or carms.base and carms.arrow calls
	}
	\item{text.size}{
		A relative value controlling the size of text displayed on the diagram. 
	}
	\item{rate.text.y.shift}{
		A relative value controlling the separation of arrow label text from the arrow itself. 
	}
	\item{shadow}{
		A logical determining whether each state on the diagram is depicted with a shadow.
	}	
}


\value{
	This function returns no value.
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}


\name{diagram.carms}
\alias{diagram.carms}

\title{
    Deliver a Markov diagram display of a carms object.
}
\description{
    This function delivers, at times with a preceeding dev.new call, a diagram (often in development) to an R graphics device.
	}
\usage{
	diagram.carms(x, text.size=0.7, rate.text.y.shift=0.7,shadow=FALSE )
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
	This function returns no value. The image on the generated graphics device is typically used for progressive 
	editing of state size, h2w, and position arguments as well as arrow arc, and arrow.position arguments.
}

\examples{
	SiSimpl<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,8))
	SiSimpl<-carms.state(SiSimpl, prob=1, name="P1", size=7, h2w=14/20, position=c(2,3) )
	SiSimpl<-carms.state(SiSimpl, prob=0, name="P2", size=7, h2w=14/20, position=c(6,3) )	
	SiSimpl<-carms.base(SiSimpl, 1, time_units="hours",  description="Failure rate")
	SiSimpl<-carms.arrow(SiSimpl, from=1, to=2, rate="B1",label="B1")
	\dontrun{
	diagram.carms(SiSimpl, shadow=TRUE)
	}
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}


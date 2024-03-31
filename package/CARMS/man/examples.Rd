\name{examples}
\alias{examples}

\title{
   Handle the installed examples in a carms project.
}
\description{
    This function delivers, a list of the examples, will "run" (source) an example script,
	copy an installed example to the working directory, or display the examples directory location.	
	}
\usage{
	examples.carms(action="list", file=NULL, package="CARMS")
	}

\arguments{
    \item{action}{
        A string indicating how the function is to operate. "list", "run", "copy" and "dir" are expected arguments.
	}
	\item{file}{
		An integer representing the file row in the "list" dataframe, or string providing the exact file name desired to be sourced. 
	}
	\item{package}{
		A string naming the package.
	}
}

\value{
	For the "list" action a dataframe with single column named "examples".
	For the "dir" action a string providing the examples directory reference.
	For a successful "run" action a 1 will be returned. Of course the diagram and plot will also display.
	For a successful "copy" action TRUE will be returned.
}

\details{
	This function is provided as a crutch for users of the CARMS package who may have no
	prior experience with R. To them a sourced script has been "run". It is also desirable 
	for them to copy example scripts into their working directory for examination and edit, rather
	than accessing the examples (and potentially modifying them) from the installed examples directory.
}

\references{

  Jan Pukite and Paul Pukite (1998), "Modeling for Reliability Analysis", IEEE Press, New York
  
  William J. Stewart (1994), "Introduction to the numerical solution of Markov chains", Princeton University Press, Princeton
}

\examples{
	examples() # will return a dataframe listing the available examples
	examples("dir") # will return the installed examples directory reference.
	\dontrun{
	examples("run", 1) # will source the first example
	examples("copy", 2) # will copy the second example to the working directory
	}
}

\name{examples.carms}
\alias{examples.carms}

\title{
   Handle the installed examples in a carms object.
}
\description{
    This function delivers, the installed directory of package examples, a list of the examples, or will
	"run" (source) an example script.
	}
\usage{
	examples.carms(action="list", file=NULL) 
	}

\arguments{
    \item{action}{
        A string indicating how the function is to operate. "list", "run" and "dir" are expected arguments.
		(actually, "list" is default and any action argument but "run" returns a string containing the directory
		  location for installed examples is returned).
	}
	\item{file}{
		An integer from 1 to 48 indicating the example to run, or string providing the exact file name desired to be sourced. 
	}
}
# carms.arrow.R
# Inspired by a CARMS application originally written by Paul Pukite in 1993
# The CARMS application was featured in a 1998 book "Modeling for Reliability Analysis"
# but was never upgraded beyond its targeted 16-bit Windows 3.1 environment.
# The CARMS package by David J. Silkworth provides an emulation of the original
# CARMS application on R where it is expected to be useable cross-platform
# and survivable in the event of future hardware and operating system upgrades.

# copyright (c) OpenReliability.org 2024
#-------------------------------------------------------------------------------
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


carms.arrow<- function(x, from, to, rate, label="",...) {			
	# need to test that x is a carms object among perhaps other validations		
	if(!is(x,"carms")){		
		stop("x  argument is not of class  carms ")	
	}		
			
	# establish the arrow element, or append to it		
	    if(is.null(x$arrow)){		
	        ## Creating the first arrow in the carms object...")		
	        i <- 1		
	        x$arrow <- list()		
	    }else{		
	        ## Appending a new state to the existing carms object...")		
	        i <- length(x$arrow)+1		
	    }		
			
	# need to establish the transition table vector for this arrow		
	if(is.character(rate)) {		
		trate<-eval(parse(text=paste(rate)))	
		if(!is.numeric(trate)) warn("transition rate has not been established numerically")	
	}else{		
		if(is.numeric(rate)) {	
			trate<-rate
		}else{	
			warn( "transition rate has not been interpreted")
		}	
	}		
	x$arrow[[i]] <- list()		
	x$arrow[[i]]$tt_vec<-c(from, to, trate)		
	x$arrow[[i]]$label<-label
		
			
	# arrow options are set on each state, or uniformly in diagram		
			
	x		
}			
			

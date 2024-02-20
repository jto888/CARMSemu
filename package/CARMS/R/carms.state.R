# carms.state.R
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



carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="") {			
	# need to test that x is a carms object among perhaps other validations		
	if(!is(x,"carms")){		
		stop("x  argument is not of class  carms ")	
	}		
	# stop if x$arrows exists		
	if(!is.null(x$arrows)) stop("states must be fully entered before arrow entries")		
			
	# establish the state element, or append to it		
	    if(is.null(x$state)){		
	        ## Creating the first state in the carms object...")		
	        i <- 1		
	        x$state <- list()		
	    }else{		
	        ## Appending a new state to the existing carms object...")		
	        i <- length(x$state)+1		
	    }		
			
			
			
			
	# diagram options for this state		
	box.size <- size/100   		
	box.prop <- h2w		
	# graph plot colot for this state		
	if(!is.null(plot.color)) {		
		col <-plot.color	
	}else{		
		col <- x$colors[i]	
	}		
			
			
	x$state[[i]] <- list()		
	x$state[[i]]$prob <- prob		
	x$state[[i]]$name <- name		
	x$state[[i]]$box.size <- box.size		
	x$state[[i]]$box.prop <- box.prop		
	x$state[[i]]$col <- col		
	x$state[[i]]$description <- description		
	# x_positions and y_positions are defined in carms.make		
	x$state[[i]]$pos<-c(x$x_positions[position[1]], x$y_positions[position[2]])		
			
			
			
	#if(!is.null(Pfunction)) {		
		 # expect a lot of validation on this Pfunction	
		# it must be a string of Pxx values separated  + perhaps or 	
		# numbers separated by colon or sum and parentheses, or number multiplier >-1 <1 	
		# when all validations are done x$defined_states=TRUE	
	#}		
			
	x		
}			

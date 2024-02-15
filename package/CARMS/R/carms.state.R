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



carms.state<-function(x, prob,  name, position,  description="",...) {					
# need to test that x is a carms object among perhaps other validations					
if(!is(x,"carms")){					
	stop("x  argument is not of class  carms ")				
}					
					
					
# establish the state element, or append to it					
    if(is.null(x$state)){					
        ## Creating the first state in the carms object...")					
        i <- 1					
        x$state <- list()					
    }else{					
        ## Appending a new state to the existing carms object...")					
        i <- length(x$state)+1					
    }					
					
					
# default diagram and plot options that can be altered independently in each state declaration					
op<-list()					
# diagram options for this state					
op$box.type <- "ellipse"			# shape for the state "box" in diagram ("rect", "diamond", "round", "hexa", "multi")		
op$box.size <- 0.06   			# length (width) of state "box" (in terms of overall diagram width?)		
op$box.prop <- 21/24			# state "box" proportions h/w		
# graph plot options for this state					
op$col <- x$colors[i]			# a color palate must be set in carms.make		
op$lty <- "solid"			# can't imagine anything other than a solid line		
op$lwd <- 2			# unlikely to change line width (in pixels?)		
op$cex.txt <- 0.6
					
# deal with dots args here with validations, keeping in mind that a Pfunction will be added here					
					
					
x$state[[i]] <- list()					
x$state[[i]]$prob <- prob					
x$state[[i]]$name <- name					
x$state[[i]]$op <- op					
x$state[[i]]$description <- description					
					
					
x$state[[i]]$pos<-c(x$x_positions[position[1]], x$y_positions[position[2]])					
					
					
					
#if(!is.null(Pfunction)) {					
	 # expect a lot of validation on this Pfunction				
	# it must be a string of Pxx values separated  + perhaps or 				
	# numbers separated by colon or sum and parentheses, or number multiplier >-1 <1 				
	# when all validations are done x$defined_states=TRUE				
#}					
					
	x				
}					

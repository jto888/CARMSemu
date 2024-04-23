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


carms.arrow<- function(x, from, to, rate, arc=0.35, arrow.position=0.5, label="") {				
	# need to test that x is a carms object among perhaps other validations			
	if(!is(x,"carms")){			
		stop("x  argument is not of class  carms ")		
	}			

	# extract the base values and place them in default labels and any custom base_label
	# within this function scope, this is done on every carms.arrow call
	nbase<-0			
	if(!is.null(x$base)) {			
		nbase<-length(x$base)		
		for(base in 1:nbase) {		
			eval(parse(text=paste0("B",base,"<-",x$base[[base]]$value)))	
			eval(parse(text=paste0("b",base,"<-",x$base[[base]]$value)))	
			if(!is.null(x$base[[base]]$base_label)) {	
				eval(parse(text=paste0(x$base[[base]]$base_label,"<-",x$base[[base]]$value)))
			}	
		}		
	}			
				
	# need to establish the transition table vector for this arrow			
	if(is.character(rate)) {			
		trate<-eval(parse(text=paste(rate)))		
		if(!is.numeric(trate)) warning("transition rate has not been established numerically")		
	}else{			
		if(is.numeric(rate)) {		
			trate<-rate	
		}else{		
			warning( "transition rate has not been interpreted")	
		}		
	}			
				
	arr.lcol <- "black"			
	arr.type <-"curved"			
	if(from==to) {			
		arr.lcol <- "white"		
		arr.type <-"none"		
	}			
				
				
				
	# establish the arrow element, or append to it			
	    if(is.null(x$arrows)){			
	        ## Creating the first arrow in the carms object...")			
		        x$arrows <- list()		
		x$arrows$narrows <- 1		
				
	# arrow options individually set for each arrow are in to_from matrix form for each option			
	# blank option matrices are created here by name to be filled in  below this 'declaration' block			
		nstates<-length(x$state)		
		x$arrows$curve<-matrix(nrow=nstates, ncol=nstates, byrow = TRUE, data = 0)		
		x$arrows$arr.pos<-matrix(nrow=nstates, ncol=nstates, byrow = TRUE, data = 0)		
		x$arrows$arr.type<-matrix(nrow=nstates, ncol=nstates, byrow = TRUE, data = 0)		
		x$arrows$arr.lcol<-matrix(nrow=nstates, ncol=nstates, byrow = TRUE, data = 0)		
				
	    }else{			
	        ## Appending a new arrow to arrows carms object...")			
		x$arrows$narrows <- x$arrows$narrows +1		
	    }			
	
	#  modify the curve matrix for this current arrow entry 			
	x$arrows$curve[to, from] <- (-1)*arc			
	x$arrows$arr.pos[to, from] <- arrow.position			
	x$arrows$arr.lcol[to, from] <- arr.lcol			
	x$arrows$arr.type[to, from] <- arr.type			
				
				
				
	# now save a list of attributes for this arrow			
	x$arrows$arrow[[x$arrows$narrows]]<- list()			
				
	x$arrows$arrow[[x$arrows$narrows]]$tt_vec<-c(from, to, trate)			
	x$arrows$arrow[[x$arrows$narrows]]$label<-label			
				
				
				
	x		 	
}				
				

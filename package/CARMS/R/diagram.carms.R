# diagram.carms.R
# Inspired by a CARMS application originally written by Paul Pukite in 1993
# The CARMS application was featured in a 1998 book "Modeling for Reliability Analysis"
# but was never upgraded beyond its targeted 16-bit Windows 3.1 environment.
# The CARMS package by David Silkworth provides an emulation of the original
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




diagram.carms<-function(x) {
	# need to test that x is a carms object among perhaps other validations					
	if(!is(x,"carms")){					
		stop("x  argument is not of class  carms ")				
	}
	if(is.null(x$state)) stop("no states defined in carms object")
	
	nstates<-length(x$state)				
	M<-matrix(0,nrow=nstates, ncol=nstates)				
					
				
	pos<-x$state[[1]]$pos			
	name_vec<-x$state[[1]]$name			
	box.lwd<-x$state[[1]]$op$lwd			
	cex.txt<-x$state[[1]]$op$cex.txt			
	box.size<-x$state[[1]]$op$box.size			
	box.type<-x$state[[1]]$op$box.type			
	box.prop<-x$state[[1]]$op$box.prop			
				
	if(nstates>1) {			
		for(state in 2:nstates) {			
			pos<-rbind(pos, x$state[[state]]$pos)
			# names is a reserved label in R
			name_vec<-c(name_vec, x$state[[state]]$name)		
			box.lwd<-c(box.lwd, x$state[[state]]$op$lwd)		
			cex.txt<-c(cex.txt, x$state[[state]]$op$cex.txt)		
			box.size<-c(box.size, x$state[[state]]$op$box.size)		
			box.type<-c(box.type, x$state[[state]]$op$box.type)		
			box.prop<-c(box.prop, x$state[[state]]$op$box.prop)		
		}			
	}				
	# transition arrows now need to be established				
					
					
	# diagram::plotmat should be imported to CARMS				
	#require(diagram)				
					
	# plot just the states (because arrows have not yet been defined)				
	if(is.null(x$arrow)) {				
	plotmat(M, pos, name=name_vec, lwd=1, latex=TRUE,				
		box.lwd=box.lwd, cex.txt=cex.txt, box.size=box.size,			
		box.type=box.type, box.prop=box.prop)			
	}				
}					

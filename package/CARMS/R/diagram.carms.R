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




diagram.carms<-function(x, text.size=0.7, rate.text.y.shift=0.5,shadow=TRUE ) {				
	# need to test that x is a carms object among perhaps other validations			
	if(!is(x,"carms")){			
		stop("x  argument is not of class  carms ")		
	}			
	if(is.null(x$state)) stop("no states defined in carms object")			
				
	nstates<-length(x$state)			
	M<-matrix(0,nrow=nstates, ncol=nstates)			
				
	# set single option defaults			
	box.lwd <- 2			
	box.type <- "ellipse"			
	self.lwd <- 0.001		# try not to show self arrow	
	shadow.size <- 0.01			
	if(shadow==FALSE) shadow.size<-0			
	dtext <- (-1)*rate.text.y.shift			
	cex<-text.size			
				
	pos<-x$state[[1]]$pos			
	name_vec<-x$state[[1]]$name			
				
	# box.size and box.prop are no longer listed as options ($op)			
	box.size<-x$state[[1]]$box.size			
				
	box.prop<-x$state[[1]]$box.prop			
				
	if(nstates>1) {			
		for(state in 2:nstates) {		
			pos<-rbind(pos, x$state[[state]]$pos)	
			# names is a reserved label in R	
			name_vec<-c(name_vec, x$state[[state]]$name)	
				
				
			box.size<-c(box.size, x$state[[state]]$box.size)	
				
			box.prop<-c(box.prop, x$state[[state]]$box.prop)	
		}		
	}			
				
	if(!is.null(x$arrows)) {			
		# transition arrows now need to be established		
		for(ar in 1:length(x$arrows$arrow)) {		
			M[x$arrows$arrow[[ar]]$tt_vec[2], x$arrows$arrow[[ar]]$tt_vec[1]]<-x$arrows$arrow[[ar]]$label	
				
		}		
				
		# previously thought of as options, now direct members of x$arrows		
		curve<-x$arrows$curve		
		arr.pos <- x$arrows$arr.pos		
		arr.lcol <- x$arrows$arr.lcol		
		arr.type <- x$arrows$arr.type		
				
	}			
				
	require(diagram)
	
		if(is.null(x$arrows)) {				
	# plotmat call for states only, before arrows are defined					
			plotmat(M, pos, name=name_vec, lwd=2, latex=TRUE,			
				box.lwd=box.lwd, box.size=box.size,		
				box.type=box.type, box.prop=box.prop,		
				cex=cex, self.lwd=self.lwd,		
				shadow.size=shadow.size		
				)		
		}else{				
	# new plotmat call with arrows					
			plotmat(M, pos, name=name_vec, lwd=2, latex=TRUE,			
				box.lwd=box.lwd, box.size=box.size,		
				box.type=box.type, box.prop=box.prop,		
				cex=cex, cex.txt=cex*9/7, self.cex=cex*14/7, self.lwd=self.lwd,		
				dtext=dtext, arr.pos=arr.pos,		
				self.shiftx=-.12,		
				self.shifty=.12,		
				arr.lcol=arr.lcol,		
				arr.type=arr.type,		
				shadow.size=shadow.size, curve=curve		
				)		
		}				
		
				
				
}				
				
					
diagram <- diagram.carms
# carms.make.R
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



carms.make<-function(title, diagram_grid=c(11,11),...) {			
	obj<-list()		
	obj$title <- title		
	# this color palate should be alterable with option input through dots
	# however this has not yet been implemented.
	# in near term this should be a 32 item list, with 16 colors replicated		
	obj$colors <- c("red4","lightseagreen","darkkhaki","navyblue","darkorchid3","turquoise4", "gray75","lightgreen")		
			
	# by default there are no defined states		
	obj$defined_states<-FALSE		
			
			
			
	# it could be tested that this is a 2 element vector		
	obj$diagram_grid=diagram_grid		
			
	x_positions<-function(dcols) {		
		x_start<-1/(2*dcols)	
		x_pos<-x_start	
		for(xtile in 2:dcols) {	
			x_pos<-c(x_pos, x_pos[xtile-1]+2*x_start)
		}	
		x_pos 	
	}		
			
	y_positions<-function(drows) {		
		y_start<- 1- 1/(2*drows)	
		y_pos<-y_start	
		for(ytile in 2:drows) {	
			y_pos<-c(y_pos, y_pos[ytile-1]-2*(1-y_start))
		}	
		y_pos 	
	}		
			
	obj$x_positions<-x_positions(diagram_grid[2])		
	obj$y_positions<-y_positions(diagram_grid[1])		
			
			
	class(obj) <- "carms"		
	obj 		
			
			
}			

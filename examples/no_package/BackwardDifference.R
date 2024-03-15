
BackwardDifference<-function(states, tt, simcontrol)  {					
	# generate key parameters for Stewart's algorithm				
		t<-simcontrol$mission			
		h<-t/simcontrol$intervals			
		eta<-t/h			
		y0<-states			
					
		nstates<-length(states)			
		Q<-matrix(0, nrow=nstates, ncol=nstates)			
		for( a in 1:nrow(tt)){			
			Q[tt$from[a], tt$to[a]]<-tt$rate[a]		
		}			
		diag(Q)<- (-1)*rowSums(Q)			
					
		outmat<-t(as.matrix(y0))			
		y<-y0			
					
		n<-nrow(Q)						# library(pracma)
		I<-diag(n)						# pracma::eye(n)
					
		R1<-I + h/2 * Q			
		R2<-solve(I-h*Q/2)				# pracma::inv(I-h*Q/2)
		y1<- y0 %*% R1 %*% R2 			
		outmat<-rbind(outmat, y1)			
					
		S1<- solve(3 * I/2 - h * Q)		# pracma::inv(3 * I/2 - h * Q)
					
		for (i in 2:eta) {			
			y <- (2*y1 -y0/2) %*% S1		
			outmat<- rbind(outmat, y)		
			y0<-y1		
			y1<-y		
		}			
					
	outmat				
}					

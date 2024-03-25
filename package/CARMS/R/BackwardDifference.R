#BackwardDifference.R
# This code implements the backward differentiation formula (BDF) for solving the partial differential equations
# that describe a continuos time(rate transitioning)Markov model. This code is adapted from the
# Matlab code documeneted in William Stweart's book "Introduction to Numerical Solution of Markov Chains".
# It is utilized to emulate the same functionality executed in the CARMS application.

# The most instructive aspect of this code is the infinitesimal generator, matrix Q, representing the
# transition rates applicable to the ordinary differential equations defining the Markov model.
# As the steps, eta, are advanced through time a new resultant vector y (of probabilities) progressively acts
# upon the unchanging matrix Q.


#' @noRd
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

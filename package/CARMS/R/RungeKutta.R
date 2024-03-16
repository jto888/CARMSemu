#RungeKutta.R
# This code implements the Runge-Kutta algorithm for integrating the partial differential equations
# that describe a continuos time(rate transitioning)Markov model. This code is adapted from the
# Matlab code documeneted in William Stweart's book "Introduction to Numerical Solution of Markov Chains".
# It is utilized to emulate the same functionality executed in the CARMS application.

# The most instructive aspect of this code is the infinitesimal generator, matrix Q, representing the
# transition rates applicable to the ordinary differential equations defining the Markov model.
# As the steps, eta, are advanced through time a new resultant vector y (of probabilities) progressively acts
# upon the unchanging matrix Q.



RungeKutta<-function(states, tt, simcontrol)  {				
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
				
		for(i in 1:eta) {		
			k1 <- y %*% Q	
			k2 <- (y + h/2*k1) %*% Q	
			k3 <-  (y + h/2*k2) %*% Q	
			k4  <-  (y + h*k3) %*% Q	
			y <- y + h*(k1+2*k2+2*k3+k4)/6	
			outmat<-rbind(outmat,y)	
		}		
				
	outmat			
}				

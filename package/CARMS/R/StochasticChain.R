# StochasticChain.R
# This code calls a stochastic model algorithm in C++ for the solution of the partial differenctial
# equations represented by the transtion table (tt). It is a custom solution by David Silkworth
# rather than reproducing the Petri Net solution implemented by Paul Pukite in the original
# CARMS application.

# For those interested in studying this implementation using interpreted R code the formative 
# file StochasticChain_Rcode.R has been included in the CARMS package.


#' @noRd
StochasticChain<-function(states, tt, simcontrol)  { 								
								
	tt_int<-c(tt$from, tt$to)
	tt_float<-tt$rate	
								
						
	 ## this is the old call to the unregistered C++ code in the CARMS library	
	#outmat<-.Call("ChainSim", states, tt_int, tt_float, simcontrol, PACKAGE="CARMS")
	outmat<-.Call(ChainSim, states, tt_int, tt_float, simcontrol)								
			
			nstates<-length(states)	
			initial_state_probabilities<-matrix(states, nrow=1, ncol=nstates)					
			outmat<-rbind(initial_state_probabilities, outmat)					
								
	outmat							
}								

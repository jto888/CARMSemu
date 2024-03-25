
StochasticChain<-function(states, tt, simcontrol)  { 								
								
	# This is where the tt dataframe will be separated into							
	# a stacked integer vector from tt$from and tt$to							
	# and a stacked double vector from tt$rate
	
tt_int<-c(tt$from, tt$to)
tt_float<-tt$rate	
	
	# from simulate.carms.R
#	simcontrol<-list(mission=mission_time, intervals=intervals, cycles=cycles)
# from Simulation.cpp		
#// unpack the control_list			
#	mission=L["mission"];		
#	intervals=L["intervals"];		
#	cycles=L["cycles"];									
								
	################## this is the place to go to C++ #####################							
	 ## this is the old call to the unregistered C++ code in the CARMS library	
	outmat<-.Call("ChainSim", states, tt_int, tt_float, simcontrol, PACKAGE="CARMS")								
	################## this is the place to return from C++ #####################							
		# outmat is the return object from C++						
		# These final steps are just as easy to do in R	
			#mission <- simcontrol$mission
			#intervals <- simcontrol$intervals
			#cycles <- simcontrol$cycles
			#stepsize<-mission/intervals					
			#outmat<-out[[1]]/(stepsize*cycles)
			
			nstates<-length(states)	
			initial_state_probabilities<-matrix(states, nrow=1, ncol=nstates)					
			outmat<-rbind(initial_state_probabilities, outmat)					
								
	outmat							
}								

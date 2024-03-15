# jeep.R				
				 
# This model considers 2 Markov chains for modest comparison in one run				
# Initial states are 1 and 3, both considering 4 tires working				
# State 2 indicates failure after one of the 4 tires goes flat				
# State 4 considers that a spare tire has been deployed				
# Finally state 5 indicates failure after one of the remaining 3 original tires or the spare go flat	

# This file is an original developmental script and is very different in execution than a file
# by the same name used as a demo within the CARMS package.			
				
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/ChainedSimulation.R")				
				
# key inputs				
	# vector of states with initial probabilities			
	states<-c(1,0,1,0,0)			
	# definition of transitions using base transition values			
	B1<-1e-4			
	B2<-2e-4			
	trans1<-data.frame(from=1, to=2, rate=4*B1)			
	trans2<-data.frame(from=3, to=4, rate=4*B1)			
	trans3<-data.frame(from=4, to=5, rate=3*B1+B2)			
	tt<-rbind(trans1, trans2, trans3)			
				
	#simulation control			
	steps<-40			
	cycles<-1000			
	simhistory<-1e4			
	simcontrol<-list(steps=steps, cycles=cycles, simhistory=simhistory)			
				
				
# Run the simulation				
	outmat<-ChainedSimulation(states, tt, simcontrol)			
				
	nstates<-length(states)			
	stepsize<-simhistory/steps			
	outmat<-outmat/(stepsize*cycles)			
	initial_state_probabilities<-matrix(states, nrow=1, ncol=nstates)			
	outmat<-rbind(initial_state_probabilities, outmat)			
				
				
# graphical characteristics				
	Title<-"Jeep    Spare tire configs"			
	time_label<-"Miles"			
	prob_label<-"Probability"			
	spline_knots<-10   # a fraction of steps to create a smoothed curve on plot			
	colors<-c("mediumorchid4","mediumseagreen","mistyrose4","navyblue","maroon4")			
				
# Generate the plot				
	x<-seq(0, simhistory, by=simhistory/steps)			
	dev.new(width=5, height=4, unit="in")			
	plot(x,outmat[,1], type="n",			
	main=Title,			
	xlab=time_label, ylab=prob_label)			
	for(state in 1:nstates) {			
		lines(smooth.spline(x,outmat[,state], nknots=spline_knots), lwd=2, col=colors[state])		
	}			
	# add a legend			
	le<-NULL; col<-NULL; lty<-NULL; cex<-NULL; lwd<-NULL			
	for(state in 1:nstates) {			
		le<-c(le, paste0("P",state, " ", round(outmat[nrow(outmat),state], 3)))		
		col<-colors[state]		
		lty<-c(lty,1)		
		lwd<-c(lwd,2)		
		cex<-c(cex, .8)		
	}			
	legend("right", legend=le, col=colors[1:state], lty=lty, lwd=lwd, cex=cex, bg="white")			

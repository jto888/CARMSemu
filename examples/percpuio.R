#percpuo.R							
							
# This model is based on 3 slots existing in a job queue for computer processing. 							
# As the cpu processes a job the I/O system can place a new job into the queue.							
							
# In state 1 the queue is full with 3 jobs for the cpu to perform.  The cpu can perform one job at a time, 							
# so state 2 is arrived at where there are 2 jobs left in the queue and one slot open. 							
# In state 2 the cpu can operate on a single job or the I/O can refill the single open slot to alter the state. 							
# Since the cpu job rate is somewhat higher than a single I/O rate there is a greater propensity to move to state 3							
# where only one job is left in the queue. Since there are 2 slots open at state 3,							
# both of the available I/O units can be deployed to resupply the queue. 							
# Finally, it is possible for the cpu to exhaust the job queue at state 4. Since the 2 I/O units are available at state 4, 							
# refilling of job slots proceeds and so there will be expected steady state performance over time.							
							
#source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/ChainedSimulation.R")							
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/RungeKutta.R")		

							
# key inputs							
	# vector of states with initial probabilities						
	states<-c(1,rep(0,3))
	nstates<-length(states)	
	# definition of transitions using base transition values						
	b1<-1.5e-1  # CPU service rate						
	b2<-1e-1   # I/O arrival rate						
	trans1<-data.frame(from=1, to=2, rate=b1)						
	trans2<-data.frame(from=2, to=3, rate=b1)						
	trans3<-data.frame(from=3, to=4, rate=b1)						
	trans4<-data.frame(from=4, to=3, rate=2*b2)						
	trans5<-data.frame(from=3, to=2, rate=2*b2)						
	trans6<-data.frame(from=2, to=1, rate=b2)						
	tt<-rbind(trans1, trans2, trans3, trans4, trans5, trans6)						
							
	#simulation control						
	steps<-100						
	cycles<-5000						
	simhistory<-60						
	simcontrol<-list(steps=steps, cycles=cycles, simhistory=simhistory)						
							
# Run the simulation
	outmat<-RungeKutta(states, tt, simcontrol)
							
#	outmat<-ChainedSimulation(states, tt, simcontrol)						
#							
#   nstates<-length(states)						
#	stepsize<-simhistory/steps						
#	outmat<-outmat/(stepsize*cycles)						
#	initial_state_probabilities<-matrix(states, nrow=1, ncol=nstates)						
#	outmat<-rbind(initial_state_probabilities, outmat)						
							
# graphical characteristics							
	Title<-"Performance queuing simulation\n3 jobs, 1 CPU, and 2 I/O devices available."						
	time_label<-"Hours"						
	prob_label<-"Probability"						
	spline_knots<-10   # a fraction of steps to create a smoothed curve on plot						
	colors<-c("red4","mediumseagreen","snow4","navyblue","maroon4")						
							
# Generate the plot	
	nstates<-length(states)					
	x<-seq(0, simhistory, by=simhistory/steps)						
	dev.new(width=5, height=4, unit="in")						
	plot(x,outmat[,1], type="n",						
	main=Title,						
	ylim=c(0,1),						
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
	legend("topright", legend=le, col=colors[1:state], lty=lty, lwd=lwd, cex=cex, bg="white")						

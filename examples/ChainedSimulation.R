#ChainedSimulation
# A first pass at simulating markov models for reliability.
# This function emulates the Petri Net solution provided in CARMS
# It is intended that this function will be converted to C++ for improved performance

# David J. Silkworth 2-1-2024

ChainedSimulation<-function(states, transition_table, simulation_control) {							
	#unpack the control_list						
		steps<-simulation_control$steps					
		cycles<-simulation_control$cycles					
		simhistory=simulation_control$simhistory					
							
	# derivations from key input						
		nstates<-length(states)					
		stepsize<-simhistory/steps					
		istate<-which(states == 1)					
		outmat<-matrix(rep(0,nstates*steps),steps,nstates)					
							
							
	# simulation code						
	for(cy in 1:cycles) {						
							
		for(st in istate) {						
								
			time<-0					
			history<-data.frame(state=st, duration=0, time=time)					
								
			while(time<simhistory) {					
			trows<-which(tt$from==history[nrow(history),1])					
								
			if(!length(trows)==0) {					
				dur<-NULL				
				for(i in 1:length(trows)) {				
					dur<-c(dur, rexp(1,tt[trows[i],3]))			
				}				
				duration<-min(dur)				
				history[nrow(history),2]<-duration				
				nextstate<-tt$to[trows[which(dur==duration)]]				
				time<-history[nrow(history),3] + duration				
				if(time>simhistory) {				
					time<-simhistory			
					duration<-time-history[nrow(history),3]			
					history[nrow(history),2]<-duration			
				}else{				
					history<-rbind(history, data.frame(state=nextstate, duration=0, time=time))			
				}				
								
			}else{					
				time<-simhistory				
				duration<-time-history[nrow(history),3]				
				history[nrow(history),2]<-duration				
			}					
								
			} # single history loop					
								
			# now fill the outmat with values derived from this history					
								
				mod_history<-history				
				start_time<-0				
			for( step in 1:steps) {					
				# update end_time for this step				
				end_time<-start_time+stepsize				
				accum_duration<-0				
				eval_time<-start_time				
				while(eval_time < end_time) {				
					# trap an occasional error that occurs when mod_history is empty but for some reason eval_time is not exactly equal to end_time			
					if(nrow(mod_history) == 0) break			
					if( (mod_history$duration[1]+accum_duration)>stepsize ) {			
						# duration for this state is stepsize - accum_duration		
						this_state<-mod_history$state[1]		
						outmat[step, this_state]<-outmat[step, this_state] + (stepsize - accum_duration)		
						# modify line 1 of mod_history to reflect remaining duration to carry over to next step		
						mod_history$duration[1]<-mod_history$duration[1] - (stepsize - accum_duration)		
						mod_history$time[1]<-end_time		
						# adjust start_time for next step		
						eval_time<-end_time  # this will terminate the while loop for this step		
						start_time<- end_time		
					}else{			
						# add this duration to outmat for this state		
						this_state<-mod_history$state[1]		
						outmat[step, this_state]<-outmat[step, this_state] + mod_history$duration[1]		
						# update accum_duration		
						accum_duration<-accum_duration+mod_history$duration[1]		
						# delete this line from mod_history		
						eval_time<-mod_history$time[1] +accum_duration		
						mod_history<-mod_history[-1,]		
					}			
				}				
			}  # next step					
								
		} # next initial state (if it exists)						
							
	} # next cycle						
							
	outmat						
}							

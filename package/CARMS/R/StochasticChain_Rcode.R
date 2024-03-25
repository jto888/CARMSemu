
StochasticChain_Rcode<-function(states, tt, simcontrol)  { 								
								
	# This is where the tt dataframe will be separated into							
	# a stacked integer vector from tt$from and tt$to							
	# and a stacked double vector from tt$rate							
								
								
	################## this is the place to go to C++ #####################							
								
								
	#unpack the control_list							
		intervals<-simcontrol$intervals					
		cycles<-simcontrol$cycles			
		mission=simcontrol$mission						
								
	# derivations from key input							
		nstates<-length(states)						
		stepsize<-mission/intervals						
		istate<-which(states == 1)						
		outmat<-matrix(rep(0,nstates*intervals),intervals,nstates)						
								
								
								
								
		# simulation code						
		for(sim in 1:cycles) {						
								
		for(st in istate) {						
								
			time<-0					
			history<-data.frame(state=st, duration=0, time=time)					
								
			while(time<mission) {					
			trows<-which(tt$from==history[nrow(history),1])					
								
			if(!length(trows)==0) {					
				dur<-NULL				
				for(i in 1:length(trows)) {	
					if(tt[trows[i],3] > 0)  {
						dur<-c(dur, rexp(1,tt[trows[i],3]))	
					}						
				}
				duration <- dur[1]
				if(length(dur)>1) {
					duration<-min(dur)
				}
				history[nrow(history),2]<-duration				
				nextstate<-tt$to[trows[which(dur==duration)]]				
				time<-history[nrow(history),3] + duration				
				if(time>mission) {				
					time<-mission			
					duration<-time-history[nrow(history),3]			
					history[nrow(history),2]<-duration			
				}else{				
					history<-rbind(history, data.frame(state=nextstate, duration=0, time=time))			
				}				
								
			}else{					
				time<-mission				
				duration<-time-history[nrow(history),3]				
				history[nrow(history),2]<-duration				
			}					
								
			} # single history loop					
								
			# now fill the outmat with values derived from this history					
								
				mod_history<-history				
				start_time<-0				
			for( interval in 1:intervals) {					
				# update end_time for this interval				
				end_time<-start_time+stepsize				
				accum_duration<-0				
				eval_time<-start_time				
				while(eval_time < end_time) {				
					# trap an occasional error that occurs when mod_history is empty but for some reason eval_time is not exactly equal to end_time			
					if(nrow(mod_history) == 0) break			
					if( (mod_history$duration[1]+accum_duration)>stepsize ) {			
						# duration for this state is stepsize - accum_duration		
						this_state<-mod_history$state[1]		
						outmat[interval, this_state]<-outmat[interval, this_state] + (stepsize - accum_duration)		
						# modify line 1 of mod_history to reflect remaining duration to carry over to next interval		
						mod_history$duration[1]<-mod_history$duration[1] - (stepsize - accum_duration)		
						mod_history$time[1]<-end_time		
						# adjust start_time for next interval		
						eval_time<-end_time  # this will terminate the while loop for this interval		
						start_time<- end_time		
					}else{			
						# add this duration to outmat for this state		
						this_state<-mod_history$state[1]		
						outmat[interval, this_state]<-outmat[interval, this_state] + mod_history$duration[1]		
						# update accum_duration		
						accum_duration<-accum_duration+mod_history$duration[1]		
						# delete this line from mod_history		
						eval_time<-mod_history$time[1] +accum_duration		
						mod_history<-mod_history[-1,]		
					}			
				}				
			}  # next interval					
								
		} # next initial state (if it exists)						
								
		} # next cycle						
								
	################## this is the place to return from C++ #####################							
								
		# outmat is the return object from C++						
		# These final steps are just as easy to do in R						
			nstates<-length(states)					
			stepsize<-mission/intervals					
			outmat<-outmat/(stepsize*cycles)					
			initial_state_probabilities<-matrix(states, nrow=1, ncol=nstates)					
			outmat<-rbind(initial_state_probabilities, outmat)					
								
	outmat							
}								


simulate.carms<-function(x, solution, mission_time, intervals=20, cycles=1000) {			
	# need to test that x is a carms object among perhaps other validations		
	if(!is(x,"carms")){		
		stop("x  argument is not of class  carms ")	
	}		
	if(is.null(x$arrows)) stop("no transitions defined in carms object")		
			
	# define initial state probabilities		
	istates<-NULL		
	nstates<- length(x$state)		
	for(st in 1:nstates) {		
		istates<-c(istates, x$state[[st]]$prob)	
	}		
			
	# prepare the transition table		
	tt_mat<-NULL		
	for(ar in 1:x$arrows$narrows) {		
		tt_mat<-rbind(tt_mat, x$arrows$arrow[[ar]]$tt_vec)	
	}		
			
	from<-as.integer(tt_mat[,1])		
	to<-as.integer(tt_mat[,2])		
	rate<-tt_mat[,3]		
	tt<-data.frame(from, to, rate)		
			
	simcontrol<-list(mission=mission_time, intervals=intervals, cycles=cycles)		
	if(solution=="rk") {		
	P<-RungeKutta(istates, tt, simcontrol)		
	}		
	if(solution=="bd") {		
	P<-BackwardDifference(istates, tt, simcontrol)		
	}		
	if(solution=="chain") {		
	P<-StochasticChain(istates, tt, simcontrol)		
	}		
			
	if(!is.null(x$Pfunction) )  {		
		for(pf in 1:length(x$Pfunction) ) {
			t<-seq(0, mission_time, by=mission_time/intervals)
			eval(parse(text=x$Pfunction[[pf]]))
		}	
	}		
			
	# populate x$simulation		
	x$simulation<-list()		
	x$simulation$solution<-solution		
	x$simulation$simcontrol<-simcontrol		
	x$simulation$P<-P		
			
	Q<-matrix(0, nrow=nstates, ncol=nstates)		
	for( a in 1:nrow(tt)){		
		Q[tt$from[a], tt$to[a]]<-tt$rate[a]	
	}		
	diag(Q)<- (-1)*rowSums(Q)		
	x$simulation$Q<-Q		
			
			
	x		
}			

# fake S3 emulation
simulate<-simulate.carms
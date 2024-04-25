Andrews_Tolo.carms<-function(x) {				
	# need to test that x is a carms object among perhaps other validations			
	if(!is(x,"carms")){			
		stop("x  argument is not of class  carms ")		
	}			
	if(is.null(x$arrows)) stop("no transitions defined in carms object")			
				
	nstates<- length(x$state)			
				
	# prepare the transition table			
	tt_mat<-NULL			
	for(ar in 1:x$arrows$narrows) {			
		tt_mat<-rbind(tt_mat, x$arrows$arrow[[ar]]$tt_vec)		
	}			
				
	from<-as.integer(tt_mat[,1])			
	to<-as.integer(tt_mat[,2])			
	rate<-tt_mat[,3]			
	tt<-data.frame(from, to, rate)			
				
	unique(tt$from)			
	if(! identical(seq(1,nstates),unique(tt$from))) stop("Not a closed model")		
				
	Q<-matrix(0, nrow=nstates, ncol=nstates)			
	for( a in 1:nrow(tt)){			
		Q[tt$from[a], tt$to[a]]<-tt$rate[a]		
	}			
				
	diag(Q)<- (-1)*rowSums(Q)			
				
	StateProbability<-solve(rbind(t(Q)[-1,], rep(1,nstates)), c(rep(0,nstates-1),1))			
	StateIntensity<-NULL			
	for(st in seq(1:nstates) ) {			
		intensity<-0		
		arows<-which(tt$to==st)		
		for(ar in seq(1:length(arows)) ) {		
			intensity<-intensity+(StateProbability[tt$from[arows[ar]]]) * tt$rate[arows[ar]]	
		}		
		StateIntensity<-c(StateIntensity, intensity)		
	}			
				
				
	StateIntensity			
				
	ModelResult<-data.frame(State=seq(1,4), Probabililty=StateProbability, Intensity=StateIntensity)			
				
	ModelResult			
}				

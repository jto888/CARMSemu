Andrews_Tolo.carms<-function(x) {				
	# need to test that x is a carms object among perhaps other validations			
	if(!is(x,"carms")){			
		stop("x  argument is not of class  carms ")		
	}			
	if(is.null(x$arrows)) stop("no transitions defined in carms object")			
				
	nstates<- length(x$state)	
	istates<-NULL
	for(st in 1:nstates) {		
		istates<-c(istates, x$state[[st]]$prob)	
	}		
	if(sum(istates>1)) stop("more than one initial state in carms object")
	if(!is.null(x$Pfunction)) stop("carms object contains Pfunction(s)")

	#test for closed model
	# prepare the transition table			
	tt_mat<-NULL			
	for(ar in 1:x$arrows$narrows) {			
		tt_mat<-rbind(tt_mat, x$arrows$arrow[[ar]]$tt_vec)		
	}			
				
	from<-as.integer(tt_mat[,1])			
	to<-as.integer(tt_mat[,2])			
	rate<-tt_mat[,3]
	tt<-data.frame(from, to, rate)			

	# eliminate any zero transition rows for closed test		
		zero_rows<-which(tt_mat[3]==0)	
		if(length(zero_rows>0) )  tt_mat<-tt_mat[-zero_rows,]	
		test_closed<-intersect(unique(tt_mat[,2]), unique(tt_mat[,1]))	
		if(!length(test_closed) == length(unique(tt_mat[,2])) ) {	
			stop("Not a closed model")
		}	
### should the tt dataframe be formed here after removal of zero transitions? ###				
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

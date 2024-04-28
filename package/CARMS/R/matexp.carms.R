matexp.carms<-function(x, mission_time=NULL) {			
	# need to test that x is a carms object among perhaps other validations		
	if(!is(x,"carms")){		
		stop("x  argument is not of class  carms ")	
	}		
	if(is.null(x$arrows)) stop("no transitions defined in carms object")		
			
	if(is.null(mission_time)) {		
		if(is.null(x$simulation)) {	
			stop("need mission_time, because no simulation has been defined in carms object")
		}else{	
			mission_time<-x$simulation$simcontrol$mission
		}	
	}		
			
	# define initial state probabilities		
	istates<-NULL		
	nstates<- length(x$state)		
	for(st in 1:nstates) {		
		istates<-c(istates, x$state[[st]]$prob)	
	}		
			
	y0<-istates		
			
	# prepare the transition table		
	tt_mat<-NULL		
	for(ar in 1:x$arrows$narrows) {		
		tt_mat<-rbind(tt_mat, x$arrows$arrow[[ar]]$tt_vec)	
	}		
			
	from<-as.integer(tt_mat[,1])		
	to<-as.integer(tt_mat[,2])		
			
	rate<-tt_mat[,3]		
	tt<-data.frame(from, to, rate)		
			
	nstates<-length(istates)		
	Q<-matrix(0, nrow=nstates, ncol=nstates)		
	for( a in 1:nrow(tt)){		
			
		Q[tt$from[a], tt$to[a]]<-tt$rate[a]	
	}		
			
	diag(Q)<- (-1)*rowSums(Q)		
			
	yex<-as.vector(y0 %*% expm(mission_time *Q))		
	#yex<-y0 %*% expm(mission_time *Q)		
	yex		
}			

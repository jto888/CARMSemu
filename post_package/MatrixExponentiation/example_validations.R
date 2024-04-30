# this script will calculate an error value between the CARMS solution and
# the matrix exponetiation for single closed example models without Pfunction(s).

	outDF<-data.frame(ex=NULL, name=NULL, message=NULL, solution=NULL, intervals=NULL, err=NULL)			
#for(ex in 1:nrow(examples())) {				
for(ex in 1:48) {				
	obj_name<-substring(examples()[ex,],4,nchar(examples()[ex,])-2)			
	examples("run",ex)			
	graphics.off()			
	# test for single model			
		# define initial state probabilities		
		istates<-NULL		
		nstates<-eval(parse(text=paste0("length(",obj_name,"$state)")))		
		for(st in 1:nstates) {		
			istates<-eval(parse(text=paste0("c(istates,",obj_name,"$state[[st]]$prob)")))	
		}		
	if(sum(istates)==1) {			
		# test for no Pfunction		
		Pfunction<-eval(parse(text=paste0(obj_name,"$Pfunction")))		
		if(is.null(Pfunction)) {		
				
	#test for open model 			
		# prepare the transition table		
		tt_mat<-NULL		
		narrows<-eval(parse(text=paste0(obj_name,"$arrows$narrows")))		
		for(ar in 1:narrows) {		
			tt_mat<-eval(parse(text=paste0("rbind(tt_mat, ", obj_name,"$arrows$arrow[[ar]]$tt_vec)")))	
		}		
				
		# eliminate any zero transition rows		
			zero_rows<-which(tt_mat[3]==0)	
			if(length(zero_rows>0) )  tt_mat<-tt_mat[-zero_rows,]	
			test_closed<-intersect(unique(tt_mat[,2]), unique(tt_mat[,1]))	
			if(!length(test_closed) == length(unique(tt_mat[,2])) ) {	
				
	# can calculate error value for this model			
		yex<-eval(parse(text=paste0("matexp.carms(",obj_name,")")))		
		y<-eval(parse(text=paste0("as.vector(tail(matP(",obj_name,"),1))")))		
		err<-norm(as.matrix(y-yex),"2")		
		message<-"error calc ok"		
			}else{	
				message<-"closed model"
				err<-NA
			}	
				
		}else{		
			message<-"Pfunction exists"	
			err<-NA	
		}		
				
	}else{			
		message<-"not a single model"		
		err<-NA		
	}			
				
	solution<-eval(parse(text=paste0(obj_name,"$simulation$solution")))			
	intervals<-eval(parse(text=paste0(obj_name,"$simulation$simcontrol$intervals")))			
				
	thisDF<-data.frame(ex=ex, name=obj_name, message=message, solution=solution, intervals=intervals, err=err)			
				
	outDF<-rbind(outDF, thisDF)			
				
				
				
}				
	outDF			

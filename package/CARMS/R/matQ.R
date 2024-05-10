#matQ.R

# extracts the infinitessimal  generator matrix from a carms object simulation 

matQ<-function(x) {

	# need to test that x is a carms object among perhaps other validations				
	if(!is(x,"carms")){				
		stop("x  argument is not of class  carms ")			
	}				
	if(is.null(x$simulation)) stop("carms object has no simulation")
	
	Q<-x$simulation$Q
	Q
}
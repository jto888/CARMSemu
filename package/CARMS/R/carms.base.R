
carms.base<-function(x, value, time_units=NULL, base_label=NULL, description="")  {		
	# need to test that x is a carms object among perhaps other validations	
	if(!is(x,"carms")){	
		stop("x  argument is not of class  carms ")
	}
	if(is.null(x$time_units) && is.null(time_units)) stop("time_units are required")		
			
	if(is.null(x$time_units)) {		
		if(!is.character(time_units)) stop("time_units must be entered as a character string") 	
		x$time_units<-time_units	
	}		
	
	# establish the base element, or append to it	
	    if(is.null(x$base)){	
	        ## Creating the first base in the carms object...")	
	        i <- 1	
	        x$base <- list()	
	    }else{	
	        ## Appending a new base to the existing carms object...")	
	        i <- length(x$base)+1	
	    }	
	x$base[[i]]<-list()	
	x$base[[i]]$value <- value	
	x$base[[i]]$description<-description

		
	# pass the base value to labels  in the global environment	
	assign(paste0("B",i), value, envir=.GlobalEnv)	
	assign(paste0("b",i), value, envir=.GlobalEnv)
	if(!is.null(base_label)) {	
		x$base[[i]]$label<-base_label	
		assign(base_label, value, envir=.GlobalEnv)	
	}

		
	x	
}
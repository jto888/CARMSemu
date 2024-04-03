				
examples.carms<- function(action="list", file=NULL, package="CARMS")  {				
	root<-system.file(package=package)			
	exdir<-paste0(root,"/examples/")			
	df<-data.frame(list.files(exdir))			
	names(df)<-"examples"			
	if(!is.null(file)) {			
		if(is(file,"numeric")) {		
		if(!file<(nrow(df)+1)) stop("file number out of range")		
			file<-df[file,]	
		}else{		
			if(!file %in% df$examples) stop("file name not found")	
		}		
	}			
	switch(action,			
		"run" = {		
			if(is.null(file)) stop("file argument is required")	
			source(paste0(root,"/examples/",file))	
			ret<-1	
		},
# as written, the copy functionality violates CRAN rules about using the wd of users
# I am content to leave this functionality out		
#		"copy" = {		
#			if(is.null(file)) stop("file argument is required")	
#			file.copy(paste0(exdir,file), paste0(getwd(),"/",file), overwrite=T)	
#			ret<-TRUE	
#		},		
		"list"= {		
			ret<-df	
		},		
		"dir"= {		
			ret<-exdir	
		},		
	stop(paste0("No handler for ", action, "action"))			
	)			
ret				
}				
				
examples<-examples.carms				
		

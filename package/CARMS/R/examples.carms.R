examples.carms<- function(action="list", file=NULL)  {			
	root<-system.file(package="CARMS")		
	exdir<-paste0(root,"/examples/")		
	df<-data.frame(list.files(exdir))		
	names(df)<-"examples"		
	if(action=="run" || action=="copy") {		
		if(is(file,"numeric")) {	
		# need to assure file number is in range 1-48	
		if(!file<49 && !file>0) stop("file number out of range")	
			file<-df[file,]
		}else{	
			if(!file %in% df$examples) stop("file name not found")
		}	
	}		
	switch(action,		
		"run" = {	
			source(paste0(root,"/examples/",file))
			ret<-1
		},	
		"copy" = {	
			file.copy(paste0(exdir,file), paste0(getwd(),"/",file), overwrite=T)
			ret<-TRUE
		},	
		"list"= {	
			ret<-df
		},	
		"dir"= {	
			ret<-exdir
		},	
	stop(paste0("No handler for ", action))		
	)		
ret			
}			
			
examples<-examples.carms			

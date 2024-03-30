examples.carms<- function(action="list", file=NULL)  {		
	root<-system.file(package="CARMS")
	df<-data.frame(list.files(paste0(root,"/examples/")))
	names(df)<-"examples"
	if(action=="run") {	
	# need a series of tests and conditions for name and pattern
		if(is(file,"numeric")) {
		# need to assure file number is in range 1-48
		if(!file<49 && !file>0) stop("file number out of range")
			source(paste0(root,"/examples/",df[file,]))
		}else{
		if(!file %in% df$examples) stop("file name not found")
			source(paste0(root,"/examples/",df[file,]))
		ret=1
		}
	}else{	
		if(action=="list") {
			ret<-df
		}else{	
			ret=paste0(root,"/examples/")
		}
	}
	
ret	
}

examples<-examples.carms

plot.carms<-function(x, spline_curve=TRUE, knots=10, ...) {					
	# need to test that x is a carms object among perhaps other validations				
	if(!is(x,"carms")){				
		stop("x  argument is not of class  carms ")			
	}				
	if(is.null(x$simulation)) stop("carms object has no simulation")				
					
	.simpleCap <- function(x) {				
	    s <- strsplit(x, " ")[[1]]				
	    paste(toupper(substring(s, 1, 1)), substring(s, 2),				
	          sep = "", collapse = " ")				
	}				
					
					
	method<-x$simulation$method				
	history<-x$simulation$simcontrol$simhistory				
	steps<-x$simulation$simcontrol$steps				
	units<- .simpleCap(x$time_units)				
	cycles<-x$simulation$simcontrol$cycles				
					
					
					
	Title<- x$title				
	# define a subtitle with simulation information				
	if(method=="rk"|| method=="bd") {				
		sub<- paste0("method: ", method, "   steps: ",steps, "   time: ", history," ",units)			
	}else{				
		sub<-paste0("method: ", method, "   steps: ",steps, "  time: ", history," ",units, "   cycles: ", cycles)			
	}				
	xlab<- .simpleCap(x$time_units)				
	ylab<- "Probability"				
	colors<- x$colors				
	lwd<- 2				
	P<- x$simulation$P				
	nstates<-length(x$state)				
	bg<-"gray95"				
					
					
	# should handle the dots here				
	# things that might be handled in the dots could be				
		# Title<-"Jeep    Spare tire configs"			
		# time_label<-"Miles"# this should be established with first base entry			
		# (but base entries are not specifically required)			
		# colors # It should be possible to override the entire color palette here			
		# prob_label<-"Probability"			
		# lwd			
					
					
	xlim<- c(-history/10,history*1.1)				
	# always probabilities?				
	ylim<-c(-.05,1.05)				
					
	# establish the tick locations (now that history has been defined)				
	small_x_ticks<-seq(xlim[1], xlim[2], by= history/40)				
	large_x_ticks<-seq(xlim[1], xlim[2], by= history/10)				
	labeled_x_ticks<-seq(0,history, by=history/5)				
	# percentage ticks are the same for all?				
	small_y_ticks<-seq(ylim[1], ylim[2], by=.02)				
	large_y_ticks<-seq(ylim[1], ylim[2], by=.1)				
	labeled_y_ticks<-seq(0,1, by=.2)				
					
					
					
					
					
					
	# Generate the plot				
	x_values<-seq(0,history, by=history/steps)				
	dev.new(width=9, height=6, unit="in")				
	 #par(mar=c(5,5,3,7), bg="gray98", xpd=FALSE)				
	par(mar=c(5,5,3,7), bg=bg, xpd=FALSE)				
	plot(x_values,x$simulation$P[,1], type="n",				
	axes=FALSE, frame=TRUE,				
	main=Title,				
	sub=sub,				
	xlab=xlab, ylab=ylab				
	)				
					
	rect(par("usr")[1], par("usr")[3],				
	     par("usr")[2], par("usr")[4],				
	     col = "white") # Color				
					
	# define axes with ticks				
	axis(1, small_x_ticks, labels=rep("", length(small_x_ticks)), tck=-0.01)				
	axis(1, large_x_ticks, labels=rep("", length(large_x_ticks)), tck=-0.03)				
	axis(1, labeled_x_ticks, labels=labeled_x_ticks, tck=-0.03)				
	axis(3, small_x_ticks, labels=rep("", length(small_x_ticks)), tck=-0.01)				
	axis(3, large_x_ticks, labels=rep("", length(large_x_ticks)), tck=-0.03)				
	axis(2, small_y_ticks, labels=rep("", length(small_y_ticks)), tck=-0.01)				
	axis(2, large_y_ticks, labels=rep("", length(large_y_ticks)), tck=-0.03)				
	axis(2, labeled_y_ticks, labels=labeled_y_ticks, tck=-0.03)				
	axis(4, small_y_ticks, labels=rep("", length(small_y_ticks)), tck=-0.01)				
	axis(4, large_y_ticks, labels=rep("", length(large_y_ticks)), tck=-0.03)				
					
	# draw the gridlines				
	abline(v=large_x_ticks, col="grey", xpd=F)				
	abline(h=large_y_ticks, col="grey", xpd=F)				
					
					
					
					
	for(state in 1:nstates) {				
		if(spline_curve==TRUE) {			
			lines(smooth.spline(x_values, x$simulation$P[,state], nknots=knots), lwd=lwd, col=colors[state])		
		}else{			
			lines(x_values, x$simulation$P[,state], lwd=lwd, col=colors[state])		
		}			
	}				
					
					
	# add a legend				
	le<-NULL; col<-NULL; lty<-NULL; cex<-NULL; lwd<-NULL				
	for(state in 1:nstates) {				
		le<-c(le, paste0("P",state, " ", round(P[nrow(P),state], 3)))			
		col<-colors[state]			
		lty<-c(lty,1)			
		lwd<-c(lwd,2)			
		cex<-c(cex, .8)			
	}				
					
	legend("topright", inset=c(-.15,0), legend=le, col=colors[1:state], lty=lty, lwd=lwd, cex=cex, bg="white", xpd=T)				
					
					
}					

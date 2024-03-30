require(CARMS)		
		
		
# usage carms.make<-function(title, diagram_grid=c(11,12),...) {		
SiMFMode<-carms.make("Single element       Multiple failure modes")		
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="") {  		
SiMFMode<-carms.state(SiMFMode, prob=1, name="P1", size=7, position=c(2,6) )		
SiMFMode<-carms.state(SiMFMode, prob=0, name="P2", size=7, position=c(6,4) )		
SiMFMode<-carms.state(SiMFMode, prob=0, name="P3", size=7, position=c(6,8) )		
SiMFMode<-carms.state(SiMFMode, prob=0, name="P2 + P3", size=9, h2w=17/26, Pfunction="P[,4]<-P[,2]+P[,3]", position=c(11,6) )		
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  		
SiMFMode<-carms.base(SiMFMode, value=1e-2, time_units="hours", description="Failure rate of mode 1")		
SiMFMode<-carms.base(SiMFMode, value=3e-2, description="Failure rate of mode 2")		
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")		
SiMFMode<-carms.arrow(SiMFMode, from=1, to=2, rate="B1", arc=.2, label="B1")		
SiMFMode<-carms.arrow(SiMFMode, from=1, to=3, rate="B2", arc=-.2, label="B2")		
SiMFMode<-carms.arrow(SiMFMode, from=2, to=4, rate=0, arc=.2, arrow.position=.7,label="Failure mode 1")		
SiMFMode<-carms.arrow(SiMFMode, from=3, to=4, rate=0, arc=-.2, label="Failure mode 2")		
 	diagram(SiMFMode)
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)	
SiMFMode<-simulate.carms(SiMFMode, solution="rk", mission_time=200, intervals=50)		
	plot(SiMFMode)	

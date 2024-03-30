library(CARMS)	
	
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 	
PerCPUIO<-carms.make(title="Performance queueing simulation        3 jobs, 1 CPU, and 2 I/O devices available",  diagram_grid=c(7,16))	
	
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")	
PerCPUIO<-carms.state(PerCPUIO, prob=1, name="3,0", size=7, h2w=20/28, position=c(3,3) )	
PerCPUIO<-carms.state(PerCPUIO, prob=0, name="2,1", size=7, h2w=14/21, position=c(7,3) )	
PerCPUIO<-carms.state(PerCPUIO, prob=0, name="1,2", size=7, h2w=14/21, position=c(11,3) )	
PerCPUIO<-carms.state(PerCPUIO, prob=0, name="0,3", size=7, h2w=14/21, position=c(15,3) )	
	
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  	
PerCPUIO<-carms.base(PerCPUIO, 1.5e-1, time_units="seconds", description="CPU service rate")	
PerCPUIO<-carms.base(PerCPUIO, 1e-1, description="I/O arrival rate")	
	
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")	
PerCPUIO<-carms.arrow(PerCPUIO, from=1, to=2, rate="b1", arc=.7, label="b1")	
PerCPUIO<-carms.arrow(PerCPUIO, from=2, to=3, rate="b1", arc=.7, label="b1")	
PerCPUIO<-carms.arrow(PerCPUIO, from=3, to=4, rate="b1", arc=.7, label="b1")	
PerCPUIO<-carms.arrow(PerCPUIO, from=4, to=3, rate="2*b2", arc=.7, label="2*b2")	
PerCPUIO<-carms.arrow(PerCPUIO, from=3, to=2, rate="2*b2", arc=.7, label="2*b2")	
PerCPUIO<-carms.arrow(PerCPUIO, from=2, to=1, rate="b2", arc=.7, label="b2")	
	dev.new(width=15, height=7, unit="in")
	diagram(PerCPUIO)
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
PerCPUIO<-simulate.carms(PerCPUIO, "rk", mission_time=50, intervals=50)	
	
plot(PerCPUIO)	

library(CARMS)		
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 	
St2Sw1<-carms.make(title="Standby        Switch rate",  diagram_grid=c(5,16))	
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")	
St2Sw1<-carms.state(St2Sw1, prob=1, name="All good", size=7, h2w=14/21, position=c(3,3) )	
St2Sw1<-carms.state(St2Sw1, prob=0, name="Component failed, spare on", size=7, h2w=14/21, position=c(7,3) )	
St2Sw1<-carms.state(St2Sw1, prob=0, name="Component switched in", size=7, h2w=14/21, position=c(11,3) )	
St2Sw1<-carms.state(St2Sw1, prob=0, name="None left", size=7, h2w=14/21, position=c(15,3) )	
	
	
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  	
St2Sw1<-carms.base(St2Sw1, 2, time_units="hours", description="Failure rate")	
St2Sw1<-carms.base(St2Sw1, 1, time_units="hours", description="Spare replacement rate")	
	
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")	
St2Sw1<-carms.arrow(St2Sw1, from=1, to=2, rate="B1", arc=.7, label="B1")	
St2Sw1<-carms.arrow(St2Sw1, from=2, to=3, rate="B2", arc=.7, label="B2")	
St2Sw1<-carms.arrow(St2Sw1, from=3, to=4, rate="B1", arc=.7, label="B1")	
	dev.new(width=15, height=7, unit="in")
	diagram(St2Sw1)
	
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St2Sw1<-simulate.carms(St2Sw1, "rk", mission_time=2, intervals=50)	
	
plot(St2Sw1)	

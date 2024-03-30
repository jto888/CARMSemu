library(CARMS)	
	
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 	
library(CARMS)	
rm(list=ls(all=TRUE))	
	
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 	
St3SNS<-carms.make(title="Standby        Non-zero standby failure rate",  diagram_grid=c(7,16))	
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")	
St3SNS<-carms.state(St3SNS, prob=1, name="3 good", size=7, h2w=20/28, position=c(3,3) )	
St3SNS<-carms.state(St3SNS, prob=0, name="2 good", size=7, h2w=14/21, position=c(7,3) )	
St3SNS<-carms.state(St3SNS, prob=0, name="1 good", size=7, h2w=20/28, position=c(11,3) )	
St3SNS<-carms.state(St3SNS, prob=0, name="Failed state", size=7, h2w=20/28, position=c(15,3) )	
	
	
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  	
St3SNS<-carms.base(St3SNS, 1e-2, time_units="hours", description="Failure rate")	
St3SNS<-carms.base(St3SNS, 1e-3, time_units="hours", description="Non-operational standby failure rate")	
	
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")	
St3SNS<-carms.arrow(St3SNS, from=1, to=2, rate="B1+2*B2", arc=.7, label="B1+2*B2")	
St3SNS<-carms.arrow(St3SNS, from=2, to=3, rate="B1+B2", arc=.7, label="B1+B2")	
St3SNS<-carms.arrow(St3SNS, from=3, to=4, rate="B1", arc=.7, label="B1")	
	dev.new(width=15, height=7, unit="in")
	diagram(St3SNS)
	
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St3SNS<-simulate.carms(St3SNS, "rk", mission_time=200, intervals=50)	
	
plot(St3SNS)	

library(CARMS)
	
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 	
St3Sw<-carms.make(title="Standby        With spare replacement rate",  diagram_grid=c(7,16))	
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")	
St3Sw<-carms.state(St3Sw, prob=1, name="All good", size=7, h2w=22/34, position=c(3,3) )	
St3Sw<-carms.state(St3Sw, prob=0, name="Equipment down", size=7, h2w=22/34, position=c(7,3) )	
St3Sw<-carms.state(St3Sw, prob=0, name="Equipment up", size=7, h2w=22/34, position=c(11,3) )	
St3Sw<-carms.state(St3Sw, prob=0, name="Equipment down", size=7, h2w=22/34, position=c(15,3) )	
St3Sw<-carms.state(St3Sw, prob=0, name="Equipment up", size=7, h2w=22/34, position=c(11,6) )	
St3Sw<-carms.state(St3Sw, prob=0, name="No equipment", size=7, h2w=22/34, position=c(15,6) )	
	
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  	
St3Sw<-carms.base(St3Sw, 1e-2, time_units="hours", description="Failure rate")	
St3Sw<-carms.base(St3Sw, 1, time_units="hours", description="Spare replacement rate")	
	
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")	
St3Sw<-carms.arrow(St3Sw, from=1, to=2, rate="B1", arc=.7, label="B1")	
St3Sw<-carms.arrow(St3Sw, from=2, to=3, rate="B2", arc=.7, label="B2")	
St3Sw<-carms.arrow(St3Sw, from=3, to=4, rate="B1", arc=.7, label="B1")	
St3Sw<-carms.arrow(St3Sw, from=4, to=5, rate="B2", arc=-.2, label="B2")	
St3Sw<-carms.arrow(St3Sw, from=5, to=6, rate="B1", arc=.7, label="B1")	
	dev.new(width=15, height=7, unit="in")
	diagram(St3Sw)
	
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St3Sw<-simulate.carms(St3Sw, "bd", mission_time=200, intervals=50)	
	
plot(St3Sw)	

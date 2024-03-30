require(CARMS)
#.pardefault <- par()
#dev.off()
# Error in supressWarnings(par(.pardefault)) : 
# could not find function "supressWarnings"
# supressWarnings(par(.pardefault))	
#par(.pardefault)

	
# usage: carms.make(title, diagram_grid=c(11,12),...)	
	SiSimpl<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,8))
#usage: carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")	
	SiSimpl<-carms.state(SiSimpl, prob=1, name="P1", size=7, h2w=14/20, position=c(2,3) )
	SiSimpl<-carms.state(SiSimpl, prob=0, name="P2", size=7, h2w=14/20, position=c(6,3) )
# usage: carms.base(x, value, time_units=NULL, base_label=NULL, description="")  	
	SiSimpl<-carms.base(SiSimpl, 1, time_units="hours",  description="Failure rate")
#usage: carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
	SiSimpl<-carms.arrow(SiSimpl, from=1, to=2, rate="B1",label="B1")
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)	
	SiSimpl<-simulate(SiSimpl, solution="bd", mission_time=4)
	
	diagram(SiSimpl)
	plot(SiSimpl)
	
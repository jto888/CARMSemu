library(CARMS)
rm(list=ls(all=TRUE))

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
Pa2Diff<-carms.make(title="Parallel        Different failure rates", diagram_grid=c(9,13))
#usage: carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa2Diff<-carms.state(Pa2Diff, prob=1, name="Both modes operational", size=11, h2w=24/48, position=c(3,5) )
Pa2Diff<-carms.state(Pa2Diff, prob=0, name="Mode 1 only", size=11, h2w=24/48, position=c(7,3) )
Pa2Diff<-carms.state(Pa2Diff, prob=0, name="Mode 2 only", size=11, h2w=24/48, position=c(7,7) )
Pa2Diff<-carms.state(Pa2Diff, prob=0, name="Failure state", size=11, h2w=24/48, position=c(11,5) )

# usage: carms.base(x, value, time_units=NULL, base_label=NULL, description="")
Pa2Diff<-carms.base(Pa2Diff, 1e-2, time_units="hours", description="Failure rate #1")
Pa2Diff<-carms.base(Pa2Diff, 2e-2, time_units="hours", description="Failure rate #2")

#usage: carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa2Diff<-carms.arrow(Pa2Diff, from=1, to=2, rate="B2", arc=.2, label="B2")
Pa2Diff<-carms.arrow(Pa2Diff, from=2, to=4, rate="B1", arc=.2, label="B1")
Pa2Diff<-carms.arrow(Pa2Diff, from=1, to=3, rate="B1", arc= -.2, label="B1")
Pa2Diff<-carms.arrow(Pa2Diff, from=3, to=4, rate="B2", arc= -.2, label="B2")

diagram(Pa2Diff)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
	Pa2Diff<-simulate.carms(Pa2Diff, "rk", mission_time=200, intervals=50)

plot(Pa2Diff)

library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(11,12),...) {
SiRep<-carms.make("Single element         Simple repair")
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="") {  
SiRep<-carms.state(SiRep, prob=1, name="initial state", size=11, h2w=16/38, position=c(2,6) )
SiRep<-carms.state(SiRep, prob=0, name="repairable state", size=11, h2w=16/38, position=c(10,6) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  
SiRep<-carms.base(SiRep, 1e-1, time_units="hours", description="Failure rate")
SiRep<-carms.base(SiRep, 2e2, time_units="hours", description="Repair rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
SiRep<-carms.arrow(SiRep, from=1, to=2, rate="B1", arc=.2, label="B1")
SiRep<-carms.arrow(SiRep, from=2, to=1, rate="B2", arc= .2, label="B2")

diagram(SiRep)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
SiRep<-simulate.carms(SiRep, solution="bd", mission_time=100, intervals=50)

plot(SiRep,spline_curve=F)

library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
St2Stor<-carms.make(title="standby        Finite storage failure rate", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
St2Stor<-carms.state(St2Stor, prob=1, name="Both good", size=11, h2w=24/48, position=c(3,5) )
St2Stor<-carms.state(St2Stor, prob=0, name="Primary failed", size=11, h2w=24/48, position=c(7,3) )
St2Stor<-carms.state(St2Stor, prob=0, name="Standby mode failure", size=11, h2w=24/48, position=c(7,7) )
St2Stor<-carms.state(St2Stor, prob=0, name="Failure state", size=11, h2w=24/48, position=c(11,5) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
St2Stor<-carms.base(St2Stor, 1, time_units="hours", description="Failure rate")
St2Stor<-carms.base(St2Stor, 2e-2, time_units="hours", description="Non-operational failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
St2Stor<-carms.arrow(St2Stor, from=1, to=2, rate="B1", arc=.35, label="B1")
St2Stor<-carms.arrow(St2Stor, from=1, to=3, rate="B2", arc= -.35, label="B2")
St2Stor<-carms.arrow(St2Stor, from=2, to=4, rate="B1", arc=.35, label="B1")
St2Stor<-carms.arrow(St2Stor, from=3, to=4, rate="B1", arc= -.35, label="B1")
dev.new(width=12, height=7, unit="in")
diagram(St2Stor)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St2Stor<-simulate.carms(St2Stor, "rk", mission_time=5, intervals=50)

plot(St2Stor)

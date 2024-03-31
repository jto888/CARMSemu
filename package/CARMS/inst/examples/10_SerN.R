library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
SerN<-carms.make(title="Series         N components", diagram_grid=c(5,8))

#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
SerN<-carms.state(SerN, prob=1, name="Good", size=7, h2w=14/24, position=c(2,3) )
SerN<-carms.state(SerN, prob=0, name="Failed", size=7, h2w=14/24, position=c(6,3) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
SerN<-carms.base(SerN, 1, time_units="hours",  description="Failure rate")
SerN<-carms.base(SerN, 2e+1,  base_label="N", description="N is number of parts")

# usage{carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
SerN<-carms.arrow(SerN, from=1, to=2, rate="N*B1",label="N*B1")

# simulate.carms(x, solution, mission_time, intervals=50, cycles=1000)
SerN<-simulate.carms(SerN, solution="rk", mission_time=.2)

diagram.carms(SerN)
plot.carms(SerN)
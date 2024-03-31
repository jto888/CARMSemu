library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
Ser2<-carms.make(title="Series         Two components", diagram_grid=c(5,8))

#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Ser2<-carms.state(Ser2, prob=1, name="Good", size=7, h2w=18/34, position=c(2,3) )
Ser2<-carms.state(Ser2, prob=0, name="Failed", size=7, h2w=18/34, position=c(6,3) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
Ser2<-carms.base(Ser2, 1, time_units="hours",  description="Component 1 failure rate")
Ser2<-carms.base(Ser2, 2e-1,  description="Component 2 failure rate")

# usage{carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Ser2<-carms.arrow(Ser2, from=1, to=2, rate="B1+B2",label="B1+B2")

# simulate.carms(x, solution, mission_time, intervals=50, cycles=1000)
Ser2<-simulate.carms(Ser2, solution="rk", mission_time=2)

diagram.carms(Ser2)
plot.carms(Ser2)
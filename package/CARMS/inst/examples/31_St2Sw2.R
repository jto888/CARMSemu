library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
St2Sw2<-carms.make(title="standby        Switch failure with 2 modes", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
St2Sw2<-carms.state(St2Sw2, prob=1, name="Primary & Switch OK", size=11, h2w=18/34, position=c(3,5) )
St2Sw2<-carms.state(St2Sw2, prob=0, name="Switch failed", size=11, h2w=18/34, position=c(7,3) )
St2Sw2<-carms.state(St2Sw2, prob=0, name="Standby or false switch", size=11, h2w=18/34, position=c(7,7) )
St2Sw2<-carms.state(St2Sw2, prob=0, name="Failed state", size=11, h2w=18/34, position=c(11,5) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
St2Sw2<-carms.base(St2Sw2, 1, time_units="hours", description="Failure rate")
St2Sw2<-carms.base(St2Sw2, 2e-2, time_units="hours", description="Switch failure rate")
St2Sw2<-carms.base(St2Sw2, 1e-3, time_units="hours", description="False switching rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
St2Sw2<-carms.arrow(St2Sw2, from=1, to=2, rate="B2", arc= .35, label="B2")
St2Sw2<-carms.arrow(St2Sw2, from=1, to=3, rate="B3+B1", arc= -.35, label="B3 + B1")
St2Sw2<-carms.arrow(St2Sw2, from=2, to=4, rate="B1", arc=.35, label="B1")
St2Sw2<-carms.arrow(St2Sw2, from=3, to=4, rate="B1", arc= -.35, label="B1")
dev.new(width=12, height=7, unit="in")
diagram(St2Sw2)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St2Sw2<-simulate.carms(St2Sw2, solution="rk", mission_time=5)

plot(St2Sw2)

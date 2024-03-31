library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
St2<-carms.make(title="Standby        Same failure rates, zero standby failure rate")
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
St2<-carms.state(St2, prob=1, name="P1", size=7, h2w=14/20, position=c(3,6) )
St2<-carms.state(St2, prob=0, name="P2", size=7, h2w=14/21, position=c(7,6) )
St2<-carms.state(St2, prob=0, name="P3", size=7, h2w=14/21, position=c(11,6) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
St2<-carms.base(St2, 1, time_units="hours", description="Primary failure rate")
St2<-carms.base(St2, 2, time_units="hours", description="Standby failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
St2<-carms.arrow(St2, from=1, to=2, rate="B1", arc=.35, label="B1")
St2<-carms.arrow(St2, from=2, to=3, rate="B2", arc=.35, label="B2")
	diagram(St2)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St2<-simulate.carms(St2, solution="rk", mission_time=2, intervals=20)

plot(St2)

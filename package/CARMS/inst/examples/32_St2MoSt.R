library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
St2MoSt<-carms.make(title="standby        Monitor and standby failure rate", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
St2MoSt<-carms.state(St2MoSt, prob=1, name="All good", size=11, h2w=18/34, position=c(3,5) )
St2MoSt<-carms.state(St2MoSt, prob=0, name="Secondary failed", size=11, h2w=18/34, position=c(7,2) )
St2MoSt<-carms.state(St2MoSt, prob=0, name="One element left", size=11, h2w=18/34, position=c(7,8) )
St2MoSt<-carms.state(St2MoSt, prob=0, name="Failed state", size=11, h2w=18/34, position=c(11,5) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
St2MoSt<-carms.base(St2MoSt, 1, time_units="hours", description="Failure rate of elements")
St2MoSt<-carms.base(St2MoSt, 1e-2, time_units="hours", description="Monitor failure rate")
St2MoSt<-carms.base(St2MoSt, 1e-2, time_units="hours", description="False switching rate of monitor")
St2MoSt<-carms.base(St2MoSt, 1e-3, time_units="hours", description="Failure rate in standby condition")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
St2MoSt<-carms.arrow(St2MoSt, from=1, to=2, rate="B1+B2+B3", arc= .35, label="B1+B2+B3")
St2MoSt<-carms.arrow(St2MoSt, from=1, to=3, rate="B4", arc= -.35, label="B4")
St2MoSt<-carms.arrow(St2MoSt, from=2, to=4, rate="B1", arc=.35, label="B1")
St2MoSt<-carms.arrow(St2MoSt, from=3, to=2, rate="B2", arc= 0, label="B2")
St2MoSt<-carms.arrow(St2MoSt, from=3, to=4, rate="B1+B3", arc= -.35, label="B1+B3")
dev.new(width=12, height=7, unit="in")
diagram(St2MoSt)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St2MoSt<-simulate.carms(St2MoSt, "rk", mission_time=2, intervals=50)

plot(St2MoSt)

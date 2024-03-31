library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
St3Mon<-carms.make(title="Standby       Switch failure rate", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
St3Mon<-carms.state(St3Mon, prob=1, name="All good", size=11, h2w=18/34, position=c(3,5) )
St3Mon<-carms.state(St3Mon, prob=0, name="Primary failed", size=11, h2w=18/34, position=c(7,2) )
St3Mon<-carms.state(St3Mon, prob=0, name="Secondary element operating", size=11, h2w=18/34, position=c(7,8) )
St3Mon<-carms.state(St3Mon, prob=0, name="Failed state", size=11, h2w=18/34, position=c(11,5) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
St3Mon<-carms.base(St3Mon, 1, time_units="hours", description="Failure rate of elements")
St3Mon<-carms.base(St3Mon, 2e-2, time_units="hours", description="Monitor failure rate")
St3Mon<-carms.base(St3Mon, 1e-2, time_units="hours", description="False switching rate of monitor")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
St3Mon<-carms.arrow(St3Mon, from=1, to=2, rate="B2", arc= .35, label="B2")
St3Mon<-carms.arrow(St3Mon, from=1, to=3, rate="B1+B3", arc= -.35, label="B1+B3")
St3Mon<-carms.arrow(St3Mon, from=2, to=4, rate="B1", arc=.35, label="B1")
St3Mon<-carms.arrow(St3Mon, from=3, to=2, rate="B1+B2+B3", arc= 0, label="B1+B2+B3")
dev.new(width=12, height=7, unit="in")
diagram(St3Mon)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
St3Mon<-simulate.carms(St3Mon, "rk", mission_time=5, intervals=50)

plot(St3Mon)

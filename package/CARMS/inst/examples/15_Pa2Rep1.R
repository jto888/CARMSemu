library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
Pa2Rep1<-carms.make(title="Parallel         Repair with 2 repairmen", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa2Rep1<-carms.state(Pa2Rep1, prob=1, name="Both elements working", size=7, h2w=14/20, position=c(3,5) )
Pa2Rep1<-carms.state(Pa2Rep1, prob=0, name="1 good, 1 in repair", size=7, h2w=14/20, position=c(7,5) )
Pa2Rep1<-carms.state(Pa2Rep1, prob=0, name="Both in repair", size=7, h2w=14/20, position=c(11,5) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
Pa2Rep1<-carms.base(Pa2Rep1, 1e-1, time_units="hours",  description="Failure rate")
Pa2Rep1<-carms.base(Pa2Rep1, 2e2, time_units="hours",  description="Repair rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa2Rep1<-carms.arrow(Pa2Rep1, from=1, to=2, rate="2*B1", arc=.35, label="2*B1")
Pa2Rep1<-carms.arrow(Pa2Rep1, from=2, to=1, rate="B2", arc=.35, label="B2")
Pa2Rep1<-carms.arrow(Pa2Rep1, from=2, to=3, rate="B1", arc=.35, label="B1")
Pa2Rep1<-carms.arrow(Pa2Rep1, from=3, to=2, rate="B2", arc=.35, label="2*B2")

dev.new(width=11, height=7, unit="in")
diagram(Pa2Rep1)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa2Rep1<-simulate.carms(Pa2Rep1, "bd", mission_time=.5, intervals=50)

plot(Pa2Rep1)

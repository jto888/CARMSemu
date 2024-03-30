library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...) 
Pa2R2St<-carms.make(title="Parallel         Two-stage repair", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa2R2St<-carms.state(Pa2R2St, prob=1, name="Both elements working", size=9, h2w=19/57, position=c(3,3) )
Pa2R2St<-carms.state(Pa2R2St, prob=0, name="One element failed", size=9, h2w=19/57, position=c(7,3) )
Pa2R2St<-carms.state(Pa2R2St, prob=0, name="Both elements down", size=9, h2w=19/57, position=c(11,3) )
Pa2R2St<-carms.state(Pa2R2St, prob=0, name="Failure found,replacing", size=9, h2w=19/57, position=c(7,6) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  
Pa2R2St<-carms.base(Pa2R2St, 1, time_units="hours",  description="Repair rate")
Pa2R2St<-carms.base(Pa2R2St, 1e-2, time_units="hours",  description="Failure rate")
Pa2R2St<-carms.base(Pa2R2St, 2, time_units="hours",  description="Debugging or fault-isolation rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa2R2St<-carms.arrow(Pa2R2St, from=1, to=2, rate="2*B2", arc=.4, label="2 * B2")
Pa2R2St<-carms.arrow(Pa2R2St, from=2, to=3, rate="B2", arc=.4, label="B2")
Pa2R2St<-carms.arrow(Pa2R2St, from=2, to=4, rate="B3", arc= -.1, label="B3")
Pa2R2St<-carms.arrow(Pa2R2St, from=4, to=1, rate="B1", arc=.2, label="B1")
Pa2R2St<-carms.arrow(Pa2R2St, from=4, to=3, rate="B2", arc= -.2, label="B2")

dev.new(width=11, height=7, unit="in")
diagram(Pa2R2St)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa2R2St<-simulate.carms(Pa2R2St, "bd", mission_time=5, intervals=100)

plot(Pa2R2St, spline_curve=F)

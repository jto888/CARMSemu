library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(11,12),...)
SiNRN<-carms.make("Single element        Repairable/nonrepairable")
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="") {
SiNRN<-carms.state(SiNRN, prob=1, name="Initial state", size=11, h2w=17/42, position=c(2,6) )
SiNRN<-carms.state(SiNRN, prob=0, name="Repairable state", size=11, h2w=20/37, position=c(10,4) )
SiNRN<-carms.state(SiNRN, prob=0, name="Unrepairable state", size=13, h2w=18/50, position=c(10,8) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
SiNRN<-carms.base(SiNRN, 1, time_units="hours", description="Repair rate")
SiNRN<-carms.base(SiNRN, 1e-2, time_units="hours", description="Failure rate")
SiNRN<-carms.base(SiNRN, 1e-3, time_units="hours", description="Unrecoverable failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
SiNRN<-carms.arrow(SiNRN, from=1, to=2, rate="B2", arc=.2, arrow.position=.6, label="B2")
SiNRN<-carms.arrow(SiNRN, from=2, to=1, rate="B1", arc=.1, arrow.position=.6, label="B1")
SiNRN<-carms.arrow(SiNRN, from=1, to=3, rate="B3", arc= -.2, arrow.position=.6, label="B3")
	diagram(SiNRN, rate.text.y.shift=0.5)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
SiNRN<-simulate.carms(SiNRN, "bd", 2000)
	plot(SiNRN)

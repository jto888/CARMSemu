library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
MV31<-carms.make(title="Majority voter        Triplex-simplex")
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
MV31<-carms.state(MV31, prob=1, name="All elements operational", size=7, h2w=14/21, position=c(3,3) )
MV31<-carms.state(MV31, prob=0, name="1 element failed, eliminated spare", size=7, h2w=14/21, position=c(7,6) )
MV31<-carms.state(MV31, prob=0, name="2 elements failed", size=7, h2w=14/21, position=c(11,9) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
MV31<-carms.base(MV31, 1e-3, time_units="hours", description="Failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
MV31<-carms.arrow(MV31, from=1, to=2, rate="3*B1", arc=.35, label="3 * B1")
MV31<-carms.arrow(MV31, from=2, to=3, rate="B1", arc=.35, label="B1")
	diagram(MV31)
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
MV31<-simulate.carms(MV31, "rk", mission_time=1000, intervals=50)

plot(MV31)

library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
MV32<-carms.make(title="Majority voter        Triplex-duplex")
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
MV32<-carms.state(MV32, prob=1, name="All elements operational", size=7, h2w=14/21, position=c(3,6) )
MV32<-carms.state(MV32, prob=0, name="1 element failed", size=7, h2w=14/21, position=c(7,6) )
MV32<-carms.state(MV32, prob=0, name="2 elements failed", size=7, h2w=14/21, position=c(11,6) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
MV32<-carms.base(MV32, 1e-3, time_units="hours", description="Failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
MV32<-carms.arrow(MV32, from=1, to=2, rate="3*B1", arc=.35, label="3 * B1")
MV32<-carms.arrow(MV32, from=2, to=3, rate="2*B1", arc=.35, label="2 * B1")
	diagram(MV32)
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
MV32<-simulate.carms(MV32, "rk", mission_time=1000, intervals=50)

plot(MV32)

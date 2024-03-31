library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
MV31Sp<-carms.make(title="Majority voter        Triplex-duplex",  diagram_grid=c(5,16))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
MV31Sp<-carms.state(MV31Sp, prob=1, name="All elements operational", size=7, h2w=14/21, position=c(3,3) )
MV31Sp<-carms.state(MV31Sp, prob=0, name="1 element failed, spare on", size=7, h2w=14/21, position=c(7,3) )
MV31Sp<-carms.state(MV31Sp, prob=0, name="2 elements left", size=7, h2w=14/21, position=c(11,3) )
MV31Sp<-carms.state(MV31Sp, prob=0, name="All failed", size=7, h2w=14/21, position=c(15,3) )


# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
MV31Sp<-carms.base(MV31Sp, 1e-3, time_units="hours", description="Failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
MV31Sp<-carms.arrow(MV31Sp, from=1, to=2, rate="3*B1", arc=.7, label="3 * B1")
MV31Sp<-carms.arrow(MV31Sp, from=2, to=3, rate="3*B1", arc=.7, label="3 * B1")
MV31Sp<-carms.arrow(MV31Sp, from=3, to=4, rate="B1", arc=.7, label="B1")
	dev.new(width=15, height=7, unit="in")
	diagram(MV31Sp)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
MV31Sp<-simulate.carms(MV31Sp, "rk", mission_time=1000, intervals=50)

plot(MV31Sp)

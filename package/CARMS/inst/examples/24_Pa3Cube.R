library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
Pa3Cube<-carms.make(title="Parallel    3D hypercube", diagram_grid=c(8,16))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa3Cube<-carms.state(Pa3Cube, prob=1, name="Initial state", size=4, h2w=21/33, position=c(2,5) )
Pa3Cube<-carms.state(Pa3Cube, prob=0, name="1 of 8 down", size=4, h2w=21/33, position=c(5,5) )
Pa3Cube<-carms.state(Pa3Cube, prob=0, name="Near neighbor down", size=4, h2w=21/33, position=c(8,5) )
Pa3Cube<-carms.state(Pa3Cube, prob=0, name="2nd neighbor", size=4, h2w=21/33, position=c(11,5) )
Pa3Cube<-carms.state(Pa3Cube, prob=0, name="Failed", size=4, h2w=21/33, position=c(14,5) )


# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
Pa3Cube<-carms.base(Pa3Cube, 1e-2, time_units="hours", description="Failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa3Cube<-carms.arrow(Pa3Cube, from=1, to=2, rate="8*B1", arc=.5, label="8 * B1")
Pa3Cube<-carms.arrow(Pa3Cube, from=2, to=3, rate="3*B1", arc=.5, label="3 * B1")
Pa3Cube<-carms.arrow(Pa3Cube, from=3, to=4, rate="4*B1", arc=.5, label="4 * B1")
Pa3Cube<-carms.arrow(Pa3Cube, from=4, to=5, rate="4*B1", arc=.5, label="4 * B1")
Pa3Cube<-carms.arrow(Pa3Cube, from=3, to=5, rate="2*B1", arc=-.7, label="2 * B1")
Pa3Cube<-carms.arrow(Pa3Cube, from=2, to=4, rate="3*B1", arc=.6, label="3 * B1")
Pa3Cube<-carms.arrow(Pa3Cube, from=2, to=5, rate="B1", arc=.8, label="B1")
	dev.new(width=15, height=5, unit="in")
	diagram(Pa3Cube, rate.text.y.shift=1.5)

Pa3Cube<-simulate.carms(Pa3Cube, "rk", mission_time=50, intervals=50)

plot(Pa3Cube)

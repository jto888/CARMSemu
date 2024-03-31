library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
Pa9Mem<-carms.make(title="Parallel    Memory module model", diagram_grid=c(15,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa9Mem<-carms.state(Pa9Mem, prob=1, name="9 good", size=3.5, h2w=18/19, position=c(2,3) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="8 good", size=3.5, h2w=18/19, position=c(4,3) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="7 good", size=3.5, h2w=18/19, position=c(6,3) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="6 good", size=3.5, h2w=18/19, position=c(8,3) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="5 good", size=3.5, h2w=18/19, position=c(10,3) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="4 good", size=3.5, h2w=18/19, position=c(2,11) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="3 good", size=3.5, h2w=18/19, position=c(4,11) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="2 good", size=3.5, h2w=18/19, position=c(6,11) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="1 good", size=3.5, h2w=18/19, position=c(8,11) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="failed state", size=3.5, h2w=18/19, position=c(10,11) )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="", size=0, h2w=18/19, position=c(1,1),
Pfunction="P[,11]<-9*P[,1]+8*P[,2]+7*P[,3]+6*P[,4]+5*P[,5]+4*P[,6]+3*P[,7]+2*P[,8]+P[,9]" )
Pa9Mem<-carms.state(Pa9Mem, prob=0, name="", size=0, h2w=18/19, position=c(1,1),
Pfunction="P[,12]<-9*exp(-t)")

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
Pa9Mem<-carms.base(Pa9Mem, 1, time_units="hours", description="Failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa9Mem<-carms.arrow(Pa9Mem, from=1, to=2, rate="9*B1", arc=.35, label="9*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=2, to=3, rate="8*B1", arc=.35, label="8*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=3, to=4, rate="7*B1", arc=.35, label="7*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=4, to=5, rate="6*B1", arc=.35, label="6*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=5, to=6, rate="5*B1", arc=-.05, label="5*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=6, to=7, rate="4*B1", arc=.35, label="4*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=7, to=8, rate="3*B1", arc=.35, label="3*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=8, to=9, rate="2*B1", arc=.35, label="2*B1")
Pa9Mem<-carms.arrow(Pa9Mem, from=9, to=10, rate="1*B1", arc=.35, label="1*B1")
	dev.new(width=15, height=7, unit="in")
	diagram(Pa9Mem, rate.text.y.shift=1.5)

Pa9Mem<-simulate.carms(Pa9Mem, "rk", mission_time=4, intervals=50)

plot(Pa9Mem)

library(CARMS)

# usage: carms.make(title, diagram_grid=c(11,12),...)
Sy2C1M<-carms.make(title="Computer         Redundant",diagram_grid=c(11, 20))

# carms.state(x, prob,  name, size=4, h2w=21/24, Pfunction=NULL, plot.line.color=NULL, position,  description="")
Sy2C1M<-carms.state(Sy2C1M, 1, "2 computers, 1 memory", size=2, h2w=7, position=c(3,6))
Sy2C1M<-carms.state(Sy2C1M, 0, "1 computer left", size=11, h2w=21/78, position=c(9,3))
Sy2C1M<-carms.state(Sy2C1M, 0, "no computers left", size=11, h2w=21/78, position=c(15,5))
Sy2C1M<-carms.state(Sy2C1M, 0, "memory failed", size=11, h2w=21/78, position=c(10,9))
Sy2C1M<-carms.state(Sy2C1M, 0, "System failed", size=11, h2w=21/78, position=c(17,8),
Pfunction="P[,5]<- P[,3] + P[,4]")
# carms.base<-function(x, value, base_label=NULL, description="")
Sy2C1M<-carms.base(Sy2C1M, 1, time_units="years", description="base1")
Sy2C1M<-carms.base(Sy2C1M, 5e-1,  description="base2")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Sy2C1M<-carms.arrow(Sy2C1M, 1, 2, rate="2*B1", arc=.2, label="2*B1")
Sy2C1M<-carms.arrow(Sy2C1M, 2, 4, rate="B2", arc=.1, label="B2")
Sy2C1M<-carms.arrow(Sy2C1M, 1, 4, rate="B2", arc=-.2, label="B2")
Sy2C1M<-carms.arrow(Sy2C1M, 2, 3, rate="B1", arc=.2, label="B1")
Sy2C1M<-carms.arrow(Sy2C1M, 3, 5, rate=0, arc=.2, label="fails")
Sy2C1M<-carms.arrow(Sy2C1M, 4, 5, rate=0, arc=-.2, label="fails")
	dev.new(width=12, height=8, unit="in")
	diagram(Sy2C1M, rate.text.y.shift=0.5,shadow=FALSE )
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Sy2C1M<-simulate(Sy2C1M, "rk", 2, 50)

plot(Sy2C1M)

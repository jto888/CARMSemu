library(CARMS)

# usage: carms.make(title, diagram_grid=c(11,12),...)
SyAIPS<-carms.make(title="System        AIPS",diagram_grid=c(11, 10))

# carms.state(x, prob,  name, size=4, h2w=21/24, Pfunction=NULL, plot.line.color=NULL, position,  description="")
SyAIPS<-carms.state(SyAIPS, prob= 1, name="G", size=4, h2w=18/20, position= c(1, 6) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="Fn", size=4, h2w=18/20, position= c(3, 4) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="Fp", size=4, h2w=18/20, position= c(3, 8) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="SF2p", size=4, h2w=18/20, position= c(6, 2) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="Fnp", size=4, h2w=18/20, position= c(6, 4) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="SFnp", size=4, h2w=18/20, position= c(6, 6) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="F2n", size=4, h2w=18/20, position= c(6, 8) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="SF2n", size=4, h2w=18/20, position= c(6, 10) )
SyAIPS<-carms.state(SyAIPS, prob= 0, name="SF2n", size=4, h2w=18/20, position= c(10, 4) )

# carms.base<-function(x, value, base_label=NULL, description="")
SyAIPS<-carms.base(SyAIPS, 1, time_units="hours", base_label="L1", description="lambda 1")
SyAIPS<-carms.base(SyAIPS, 2, base_label="L2", description="lambda 2")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
SyAIPS<-carms.arrow(SyAIPS, 1, 2, rate="3*B1", arc=.1, label="3*L1")
SyAIPS<-carms.arrow(SyAIPS, 2, 4, rate="2*B1", arc=.1, label="2*L1")
SyAIPS<-carms.arrow(SyAIPS, 2, 5, rate="5*B2", arc=.1, label="5*L2")
SyAIPS<-carms.arrow(SyAIPS, 2, 6, rate="10*B2", arc=.1, label="10*L2")
SyAIPS<-carms.arrow(SyAIPS, 3, 5, rate="B1", arc=.1, label="L1")
SyAIPS<-carms.arrow(SyAIPS, 3, 6, rate="2*B1", arc=.1, label="2*L1")
SyAIPS<-carms.arrow(SyAIPS, 3, 7, rate="12*B2", arc=.1, label="12*L2")
SyAIPS<-carms.arrow(SyAIPS, 3, 8, rate="2*B2", arc=-.1, label="2*L2")
SyAIPS<-carms.arrow(SyAIPS, 1, 3, rate="15*B2", arc=-.1, label="15*L2")
SyAIPS<-carms.arrow(SyAIPS, 5, 9, rate="14*B2+2*B1", arc=.1, label="14*L2+2*L1")
SyAIPS<-carms.arrow(SyAIPS, 7, 9, rate="13*B2+3*B1", arc=.1, label="13*L2+3*L1")
	diagram(SyAIPS, rate.text.y.shift=1.5,shadow=FALSE )

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
SyAIPS<-simulate(SyAIPS, "bd", .2,50)

plot(SyAIPS)

library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...)
Pa3SURE<-carms.make(title="Parallel    SURE model", diagram_grid=c(12,15))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa3SURE<-carms.state(Pa3SURE, prob=1, name="P1", size=4, h2w=16/20, position=c(2,2) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P2", size=4, h2w=16/20, position=c(6,2) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P3", size=4, h2w=16/20, position=c(10,2) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P4", size=4, h2w=16/20, position=c(6,6) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P5", size=4, h2w=16/20, position=c(10, 6) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P6", size=4, h2w=16/20, position=c(14,6) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P7", size=4, h2w=16/20, position=c(10,10) )
Pa3SURE<-carms.state(Pa3SURE, prob=0, name="P8", size=4, h2w=16/20, position=c(14,10 ))


# carms.base(x, value, time_units=NULL, base_label=NULL, description="")
Pa3SURE<-carms.base(Pa3SURE, 5e-4, time_units="hours",  base_label="lambda", description="failure rate")
Pa3SURE<-carms.base(Pa3SURE, 1e3, base_label="mu", description="recovery rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa3SURE<-carms.arrow(Pa3SURE, from=1, to=2, rate="3*lambda", arc=.2, label="3 * lambda")
Pa3SURE<-carms.arrow(Pa3SURE, from=2, to=3, rate="2*lambda", arc=.2, label="2 * lambda")
Pa3SURE<-carms.arrow(Pa3SURE, from=2, to=4, rate="mu", arc=-.1, label="mu")
Pa3SURE<-carms.arrow(Pa3SURE, from=4, to=5, rate="3*lambda", arc=.2, label="3 * lambda")
Pa3SURE<-carms.arrow(Pa3SURE, from=5, to=6, rate="2*lambda", arc=.1, label="2 * lambda")
Pa3SURE<-carms.arrow(Pa3SURE, from=5, to=7, rate="mu", arc= -.1, label="mu")
Pa3SURE<-carms.arrow(Pa3SURE, from=7, to=8, rate="lambda", arc=.2, label=" lambda")
dev.new(width=15, height=10, unit="in")
diagram(Pa3SURE)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa3SURE<-simulate.carms(Pa3SURE, "bd", mission_time=3000, intervals=50)

plot(Pa3SURE)

library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...) 
Pa2LS<-carms.make(title="Parallel         Load-sharing", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa2LS<-carms.state(Pa2LS, prob=1, name="Both elements good", size=7, h2w=14/20, position=c(3,5) )
Pa2LS<-carms.state(Pa2LS, prob=0, name="1 element failed", size=7, h2w=14/20, position=c(7,5) )
Pa2LS<-carms.state(Pa2LS, prob=0, name="2 elements failed", size=7, h2w=14/20, position=c(11,5) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  
Pa2LS<-carms.base(Pa2LS, 1, time_units="hours",  description="Failure rate")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa2LS<-carms.arrow(Pa2LS, from=1, to=2, rate="2*(B1/4)", arc=.35, label="2*(B1/4)")
Pa2LS<-carms.arrow(Pa2LS, from=2, to=3, rate="B1", arc=.35, label="B1")

diagram(Pa2LS)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa2LS<-simulate.carms(Pa2LS, "rk", mission_time=5, intervals=50)

plot(Pa2LS)

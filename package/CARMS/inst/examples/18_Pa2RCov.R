library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...) 
Pa2RCov<-carms.make(title="Parallel         Repair coverage", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
Pa2RCov<-carms.state(Pa2RCov, prob=1, name="Fault free", size=7, h2w=14/20, position=c(3,3) )
Pa2RCov<-carms.state(Pa2RCov, prob=0, name="Spare repaced online", size=7, h2w=14/20, position=c(7,3) )
Pa2RCov<-carms.state(Pa2RCov, prob=0, name="Failed safe", size=7, h2w=14/20, position=c(11,3) )
Pa2RCov<-carms.state(Pa2RCov, prob=0, name="Undetected failure in spare", size=7, h2w=14/20, position=c(3,8) )
Pa2RCov<-carms.state(Pa2RCov, prob=0, name="Failed unsafe", size=7, h2w=14/20, position=c(7,8) )


# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  
Pa2RCov<-carms.base(Pa2RCov, 1, time_units="hours",  description="Failure rate")
Pa2RCov<-carms.base(Pa2RCov, 9e-1,  base_label="coverage",description="coverage")

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
Pa2RCov<-carms.arrow(Pa2RCov, from=1, to=2, rate="2*B1*coverage", arc=.4, label="2*B1*coverage")
Pa2RCov<-carms.arrow(Pa2RCov, from=2, to=3, rate="B1*coverage", arc=.4, label="B1*coverage")
Pa2RCov<-carms.arrow(Pa2RCov, from=1, to=4, rate="B1*(1-coverage)", arc= 0, label="B1*(1-coverage)")
Pa2RCov<-carms.arrow(Pa2RCov, from=1, to=5, rate="B1*(1-coverage)", arc=0, label="B1*(1-coverage)")
Pa2RCov<-carms.arrow(Pa2RCov, from=2, to=5, rate="B1*(1-coverage)", arc= .2, label="B1*(1-coverage)")
Pa2RCov<-carms.arrow(Pa2RCov, from=4, to=5, rate="B1", arc= -.2, label="B1")

dev.new(width=11, height=7, unit="in")
diagram(Pa2RCov)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa2RCov<-simulate.carms(Pa2RCov, "rk", mission_time=2, intervals=50)

plot(Pa2RCov, spline_curve=T)

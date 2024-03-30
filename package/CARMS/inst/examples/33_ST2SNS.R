library(CARMS)

# usage carms.make<-function(title, diagram_grid=c(12,12),...) 
ST2SNS<-carms.make(title="Standby        Safe/unsafe failure modes", diagram_grid=c(9,13))
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
ST2SNS<-carms.state(ST2SNS, prob=1, name="All good", size=10, h2w=18/34, position=c(2,4) )
ST2SNS<-carms.state(ST2SNS, prob=0, name="Monitor failed", size=10, h2w=18/34, position=c(7,4) )
ST2SNS<-carms.state(ST2SNS, prob=0, name="Failed in safe state", size=10, h2w=18/34, position=c(12,4) )
ST2SNS<-carms.state(ST2SNS, prob=0, name="Failed in unsafe state", size=10, h2w=18/34, position=c(11,7) )

# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  
ST2SNS<-carms.base(ST2SNS, 1, time_units="hours", description="Type 1 failure rate")  
ST2SNS<-carms.base(ST2SNS, 2, time_units="hours", description="Type 2 failure rate")  
ST2SNS<-carms.base(ST2SNS, 1e-2, time_units="hours", description="False switching rate")  
ST2SNS<-carms.base(ST2SNS, 2e-2, time_units="hours", description="Monitor failure rate")  

# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
ST2SNS<-carms.arrow(ST2SNS, from=1, to=3, rate="B1+B2+B3", arc= .4, label="B1+B2+B3")
ST2SNS<-carms.arrow(ST2SNS, from=1, to=2, rate="B4", arc= .35, label="B4")
ST2SNS<-carms.arrow(ST2SNS, from=2, to=3, rate="B1", arc=.35, label="B1")
ST2SNS<-carms.arrow(ST2SNS, from=2, to=4, rate="B2", arc= -.1, label="B2")

dev.new(width=12, height=7, unit="in")
diagram(ST2SNS)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
ST2SNS<-simulate.carms(ST2SNS, "rk", mission_time=2, intervals=50)

plot(ST2SNS)
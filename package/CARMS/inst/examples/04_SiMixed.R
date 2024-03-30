library(CARMS)			
		
			
# usage carms.make<-function(title, diagram_grid=c(11,12),...) {			
SiMixed<-carms.make("Single        Mixed population")			
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")			
SiMixed<-carms.state(SiMixed, prob=3e-1, name="Population #1", size=10, h2w=14/27, position=c(3,4))			
SiMixed<-carms.state(SiMixed, prob=7e-1, name="Population #2", size=10, h2w=14/27, position=c(3,8))			
SiMixed<-carms.state(SiMixed, prob=0, name="Failed state", size=10, h2w=14/27, position=c(9,6))			
			
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  			
SiMixed<-carms.base(SiMixed, 1, time_units="Hours", description="Failure rate #1")			
SiMixed<-carms.base(SiMixed, 2, time_units="Hours", description="Failure rate #2")			
			
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")			
SiMixed<-carms.arrow(SiMixed, from=1, to=3, rate="B1", arc= .2, label="B1")			
SiMixed<-carms.arrow(SiMixed, from=2, to=3, rate="B2", arc= -.2, label="B2")			
			
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
SiMixed<-simulate.carms(SiMixed, "rk", 1)			

			diagram(SiMixed)
			plot.carms(SiMixed)

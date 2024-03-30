library(CARMS)		
		
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 		
Pa3<-carms.make(title="Parallel            Identical components", diagram_grid=c(5,15))		
		
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")		
Pa3<-carms.state(Pa3, prob=1, name="3 good", size=7, h2w=21/38, position=c(2,3) )		
Pa3<-carms.state(Pa3, prob=0, name="2 good", size=7, h2w=21/38, position=c(6,3) )		
Pa3<-carms.state(Pa3, prob=0, name="1 good", size=7, h2w=21/38, position=c(10,3) )		
Pa3<-carms.state(Pa3, prob=0, name="System failed", size=7, h2w=21/38, position=c(14,3) )		
		
		
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  		
Pa3<-carms.base(Pa3, 1e-2, time_units="hours",  description="Failure rate")		
		
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")		
Pa3<-carms.arrow(Pa3, from=1, to=2, rate="3*B1", arc=.35, label="3 * B1")		
Pa3<-carms.arrow(Pa3, from=2, to=3, rate="2*B1", arc=.35, label="2 * B1")		
Pa3<-carms.arrow(Pa3, from=3, to=4, rate="B1", arc=.35, label="B1")		
	dev.new(width=15, height=7, unit="in")	
	diagram(Pa3)
	
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa3<-simulate.carms(Pa3, "rk", mission_time=200, intervals=50)		
		
plot(Pa3, spline_curve=F)		

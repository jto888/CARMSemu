library(CARMS)		
			
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 			
Pa2Simpl<-carms.make(title="Single element        Same failure rates", diagram_grid=c(9,13))			
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")			
Pa2Simpl<-carms.state(Pa2Simpl, prob=1, name="P1", size=7, h2w=14/20, position=c(3,5) )			
Pa2Simpl<-carms.state(Pa2Simpl, prob=0, name="P2", size=7, h2w=14/20, position=c(7,5) )			
Pa2Simpl<-carms.state(Pa2Simpl, prob=0, name="P3", size=7, h2w=14/20, position=c(11,5) )
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  			
Pa2Simpl<-carms.base(Pa2Simpl, 1, time_units="hours")			
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")			
Pa2Simpl<-carms.arrow(Pa2Simpl, from=1, to=2, rate="2*B1", arc=.35, label="2 * B1")			
Pa2Simpl<-carms.arrow(Pa2Simpl, from=2, to=3, rate="B1", arc=.35, label="B1")			
			
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
	Pa2Simpl<-simulate.carms(Pa2Simpl, solution="rk", mission_time=5, intervals=50)
	
	diagram(Pa2Simpl)		
	plot(Pa2Simpl)		

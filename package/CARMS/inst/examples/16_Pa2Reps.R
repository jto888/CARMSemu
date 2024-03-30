library(CARMS)		
		
# usage carms.make<-function(title, diagram_grid=c(12,12),...) 		
Pa2Reps<-carms.make(title="Parallel         Repair, 1 component needed for operation", diagram_grid=c(9,13))		
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")		
Pa2Reps<-carms.state(Pa2Reps, prob=1, name="Both elements working", size=9, h2w=14/20, position=c(3,5) )		
Pa2Reps<-carms.state(Pa2Reps, prob=0, name="One element failed", size=9, h2w=14/20, position=c(7,5) )		
Pa2Reps<-carms.state(Pa2Reps, prob=0, name="Both elements failed", size=9, h2w=14/20, position=c(11,5) )		
		
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  		
Pa2Reps<-carms.base(Pa2Reps, 1, time_units="hours",  description="Failure rate")		
Pa2Reps<-carms.base(Pa2Reps, 2e1, time_units="hours",  description="Repair rate")		
		
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")		
Pa2Reps<-carms.arrow(Pa2Reps, from=1, to=2, rate="2*B1", arc=.35, label="2*B1")		
Pa2Reps<-carms.arrow(Pa2Reps, from=2, to=1, rate="B2", arc=.35, label="B2")		
Pa2Reps<-carms.arrow(Pa2Reps, from=2, to=3, rate="B1", arc=.35, label="B1")		
		
dev.new(width=11, height=7, unit="in")		
diagram(Pa2Reps)		
		
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
Pa2Reps<-simulate.carms(Pa2Reps, "bd", mission_time=20, cycles=100)		
		
plot(Pa2Reps, spline_curve=T)		

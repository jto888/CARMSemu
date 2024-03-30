library(CARMS)		
		
# usage carms.make<-function(title, diagram_grid=c(11,12),...) {		
SiDegr<-carms.make("Single element       Multiple failure modes")		
#usage carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="") {  		
SiDegr<-carms.state(SiDegr, prob=1, name="good", size=9, h2w=20/39, position=c(2,6) )		
SiDegr<-carms.state(SiDegr, prob=0, name="marginal", size=9, h2w=20/39, position=c(6,6) )		
SiDegr<-carms.state(SiDegr, prob=0, name="failed", size=9, h2w=20/39, position=c(10,6) )		
		
# carms.base(x, value, time_units=NULL, base_label=NULL, description="")  		
SiDegr<-carms.base(SiDegr, value=1, time_units="hours", description="good to marginal rate")		
SiDegr<-carms.base(SiDegr, value=2, time_units="hours", description="marginal to failed rate")		
SiDegr<-carms.base(SiDegr, value=1e-2, time_units="hours", description="good to failed rate")		
		
# carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")		
SiDegr<-carms.arrow(SiDegr, from=1, to=3, rate="B3", arc=.3, label="B3")		
SiDegr<-carms.arrow(SiDegr, from=1, to=2, rate="B1", arc=.2, label="B1")		
SiDegr<-carms.arrow(SiDegr, from=2, to=3, rate="B2", arc=.2, label="B2")
		
# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
SiDegr<-simulate.carms(SiDegr, solution="rk", mission_time=2, intervals=50)	
	
		diagram(SiDegr)
		plot(SiDegr)

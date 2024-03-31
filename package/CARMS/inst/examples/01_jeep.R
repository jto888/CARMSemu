require(CARMS)

# usage: carms.make(title, diagram_grid=c(11,12),...)
jeep<-carms.make("jeep    Tire configurations")

#usage: carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
jeep<-carms.state(jeep, prob=1, name="4 tires", size=7, position=c(3,4))
jeep<-carms.state(jeep, prob=0, name="3 tires", size=7, position=c(6,4))
jeep<-carms.state(jeep, prob=1, name="4 tires", size=7, position=c(3,8))
jeep<-carms.state(jeep, prob=0, name="3 tires + spare", size=7, position=c(6,8))
jeep<-carms.state(jeep, prob=0, name="3 tires", size=7, position=c(10,8))

# usage: carms.base(x, value, time_units=NULL, base_label=NULL, description="")
jeep<-carms.base(jeep, value=1e-4, time_units="miles", base_label="Flat", description="Flat Tire Rate")
jeep<-carms.base(jeep, value=1e-4, base_label="Flat", description="Flat Tire Rate")
jeep<-carms.base(jeep, value=2e-4, base_label="SpareFlat", description="Spare Tire Flat Rate")

#usage: carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
jeep<-carms.arrow(jeep, from=1, to=2, rate="4 * B1", arc=.35, label="4 * Flat")
jeep<-carms.arrow(jeep, from=3, to=4, rate="4 * B1", arc=.35, label="4 * Flat")
jeep<-carms.arrow(jeep, from=4, to=5, rate="3 * B1 + B2", arc=.35, label="3 * Flat + SpareFlat")
# add the unseen self transitions providing a case label
jeep<-carms.arrow(jeep, from=1, to=1, rate=0, label="Without Spare")
jeep<-carms.arrow(jeep, from=3, to=3, rate=0, label="With Spare")

	diagram(jeep)
# usage: simulate.carms(x, solution, mission_time, intervals=20, cycles=1000)
jeep<-simulate.carms(jeep, solution="rk", mission_time=10000, intervals=50)

	plot(jeep)

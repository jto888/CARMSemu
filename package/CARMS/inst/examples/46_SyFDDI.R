require(CARMS)

# usage: carms.make(title, diagram_grid=c(11,12),...)
SyFDDI<-carms.make(title="System        FDDI network", diagram_grid=c(25,40) )

#usage: carms.state<-function(x, prob,  name, size=4, h2w=21/24, position, plot.color=NULL,  description="")
SyFDDI<-carms.state(SyFDDI, prob=1, name="88", size=2.2, h2w=17/20, position=c(3,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="87", size=2.2, h2w=17/20, position=c(7,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="77", size=2.2, h2w=17/20, position=c(7,7) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="86", size=2.2, h2w=17/20, position=c(11,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="76", size=2.2, h2w=17/20, position=c(11,7) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="85", size=2.2, h2w=17/20, position=c(15,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="75", size=2.2, h2w=17/20, position=c(15,7) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="84", size=2.2, h2w=17/20, position=c(19,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="74", size=2.2, h2w=17/20, position=c(19,7) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="65", size=2.2, h2w=17/20, position=c(15,11) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="55", size=2.2, h2w=17/20, position=c(15,15) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="64", size=2.2, h2w=17/20, position=c(19,11) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="54", size=2.2, h2w=17/20, position=c(19,15) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="83", size=2.2, h2w=17/20, position=c(23,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="73", size=2.2, h2w=17/20, position=c(23,7) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="82", size=2.2, h2w=17/20, position=c(27,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="72", size=2.2, h2w=17/20, position=c(27,7) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="66", size=2.2, h2w=17/20, position=c(11,11) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="63", size=2.2, h2w=17/20, position=c(23,11) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="81", size=2.2, h2w=17/20, position=c(31,3) )
SyFDDI<-carms.state(SyFDDI, prob=0, name="state SS", size=2.7, h2w=6, position=c(37,11) )

# usage: carms.base(x, value, time_units=NULL, base_label=NULL, description="")
SyFDDI<-carms.base(SyFDDI, 1e-1, time_units="hours", description="mu n")
SyFDDI<-carms.base(SyFDDI, 6.086, description="lambda ac")
SyFDDI<-carms.base(SyFDDI, 6.6e-2, description="lambda pc")
SyFDDI<-carms.base(SyFDDI, 6.03e-1, description="lambda 1c")

#usage: carms.arrow(x, from, to, rate, arc=0.35, arrow.position=0.5, label="")
#SyFDDI<-carms.arrow(SyFDDI, from=11, to=13, rate=0, label="0")
SyFDDI<-carms.arrow(SyFDDI, from=1, to=2, rate="10*(b2+b3)", arc=.5, label="10*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=2, to=1, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=2, to=3, rate="8*(b2+b3)", arc=.15, label="8*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=3, to=2, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=2, to=4, rate="7*(b2+b3)", arc=.5, label="7*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=4, to=2, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=3, to=5, rate="14*(b2+b3)", arc=.5, label="14*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=5, to=3, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=4, to=5, rate="8*(b2+b3)", arc=.15, label="8*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=5, to=4, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=5, to=18, rate="7*(b2+b3)", arc=.15, label="7*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=18, to=5, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=4, to=6, rate="6*(b2+b3)", arc=.5, label="6*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=6, to=4, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=6, to=7, rate="8*(b2+b3)", arc=.15, label="8*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=7, to=6, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=5, to=7, rate="6*(b2+b3)", arc=.5, label="6*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=7, to=5, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=7, to=10, rate="7*(b2+b3)", arc=.15, label="7*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=10, to=7, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=18, to=10, rate="12*(b2+b3)", arc=.5, label="12*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=10, to=18, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=10, to=11, rate="6*(b2+b3)", arc=.15, label="6*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=11, to=10, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=6, to=8, rate="5*(b2+b3)", arc=.5, label="5*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=8, to=6, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=8, to=9, rate="8*(b2+b3)", arc=.15, label="8*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=9, to=8, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=7, to=9, rate="5*(b2+b3)", arc=.5, label="5*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=9, to=7, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=9, to=12, rate="7*(b2+b3)", arc=.15, label="7*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=12, to=9, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=10, to=12, rate="5*(b2+b3)", arc=.5, label="5*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=12, to=10, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=9, to=12, rate="7*(b2+b3)", arc=.15, label="7*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=12, to=9, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=12, to=13, rate="6*(b2+b3)", arc=.15, label="6*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=13, to=12, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=11, to=13, rate=0.0, arc=.5, label="0.0")
SyFDDI<-carms.arrow(SyFDDI, from=13, to=11, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=8, to=14, rate="4*(b2+b3)", arc=.5, label="4*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=14, to=8, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=12, to=13, rate="6*(b2+b3)", arc=.15, label="6*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=13, to=12, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=14, to=15, rate="8*(b2+b3)", arc=.15, label="8*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=15, to=14, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=9, to=15, rate="4*(b2+b3)", arc=.5, label="4*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=15, to=9, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=15, to=19, rate="7*(b2+b3)", arc=.15, label="7*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=19, to=15, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=12, to=19, rate="4*(b2+b3)", arc=.5, label="4*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=19, to=12, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=14, to=16, rate="3*(b2+b3)", arc=.5, label="3*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=16, to=14, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=16, to=17, rate="8*(b2+b3)", arc=.15, label="8*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=17, to=16, rate="b1", arc=.15, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=15, to=17, rate="3*(b2+b3)", arc=.5, label="3*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=17, to=15, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=16, to=20, rate="2*(b2+b3)", arc=.5, label="2*(b2+b3)")
SyFDDI<-carms.arrow(SyFDDI, from=20, to=16, rate="b1", arc=.45, label="b1")
SyFDDI<-carms.arrow(SyFDDI, from=20, to=21, rate="9*(b2+b3)+2*b4", arc=.45, arrow.position=0.2, label="9*(b2+b3)+2*b4")
SyFDDI<-carms.arrow(SyFDDI, from=17, to=21, rate="9*(b2+b3)+2*b4", arc=.25, arrow.position=0.5, label="9*(b2+b3)+2*b4")
SyFDDI<-carms.arrow(SyFDDI, from=19, to=21, rate="9*(b2+b3)+2*b4", arc=.05, arrow.position=0.5, label="9*(b2+b3)+2*b4")
SyFDDI<-carms.arrow(SyFDDI, from=13, to=21, rate="9*(b2+b3)+2*b4", arc=-.15, arrow.position=0.5, label="9*(b2+b3)+2*b4")
SyFDDI<-carms.arrow(SyFDDI, from=21, to=1, rate=1.0, arc=.5, arrow.position=0.5, label="1.0")

	dev.new(width=50, height=25, unit="in")
	diagram(SyFDDI, rate.text.y.shift=1.5)

# usage: simulate.carms(x, solution, mission_time, intervals=50, cycles=2000)
SyFDDI<-simulate.carms(SyFDDI, "rk", .3, 500)

	plot(SyFDDI,smooth.curve=F)

CARMS Package Validations and Studies
=====================================

 

The CARMS package on R has been developed strictly as an emulation of an
original application of the same name created by Paul Pukite in 1993. The
development of the emulation was a learning experience for dealing with Markov
models. With the package in place it is now desirable to explore Markov models
further, as Paul suggested, perhaps there should be some numerical validations
performed.

Perhaps the most significant motivator for embarking on this development has
been an interest in relating Markov models to fault tree modeling and other
stochastic models, including Petri Nets.

So in this repository will be placed a somewhat eclectic combination of reviews
and studies focusing on books and papers by others in the field.

It is immediately obvious that there are two major classes of these continuous
time Markov rate models. These are the open models characterized by ultimate
exhaustion of the mission due to lack of outward transition from at least one
state. For these models the dynamic plot of state probabilities over time is
clearly the focus of interest. The other class would be closed models. These are
characterized by all states having transitions out, often culminating in repair
or other form of restoration. In fault tree development this was also noted as
the non-repairable models versus the repairable systems. The non-repairable
models require a mission time definition. They cover such systems as rocket
launching, and aircraft flights during which repair is highly unlikely to be
possible.

In contrast to the dynamic interest in the open model. For systems defined by a
closed model the dynamic approach to steady state is often a minor
consideration. There is little interest in what may even be a contrived starting
position to the way the system is expected to operate over long periods of time.

 

John Andrews, Nottingham University

A choice presentation was made by Professor John Andrews and his assistant
Silvia Tolo at the RAMS2023 conference in Orlando . This was to demonstrate the
“next generation” of fault tree technology. This would of course pique the
interest of a FaultTree package developer on R. After a presentation of binary
decision diagrams, which are already handled by the FaultTree package, Markov
models and Petri nets were discussed for their potential to model certain
dependencies. So, okay it was time to finally look deeper into Markov models.
The CARMS emulation is an outgrowth of this awakening.

The demonstration contained simple closed models of parallel elements with
failure and repair. They made a point about modeling a dependency such that in a
shared load array after a single unit failure the fail rate of the remaining
unit would increase due to load. Beyond providing a results table for the state
probabilities, they also produced a “state intensity” value. This is the basis
for studies comparing results with the simplified fault free calculations
utilized in the FaultTree package.

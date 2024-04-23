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

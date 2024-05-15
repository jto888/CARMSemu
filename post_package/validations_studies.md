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

 

### Dynamic Dependent Fault Tree Analysis

A choice presentation was made by Professor John Andrews and his assistant
Silvia Tolo at the RAMS2023 conference in Orlando . This was to demonstrate the
“next generation” of fault tree technology. This would of course pique the
interest of a FaultTree package developer on R. After a presentation of binary
decision diagrams, which are already handled by the FaultTree package, Markov
models and Petri nets were discussed for their potential to model certain
dependencies. So, okay it was time to finally look deeper into Markov models.
The CARMS emulation is an outgrowth of this awakening.

The Markov demonstration contained simple closed models of parallel elements
with failure and repair. They made an assumption in modeling a dependency such
that after a single unit failure in a shared load array the fail rate of the
remaining unit would increase due to load. Beyond providing a results table for
the state probabilities, they also produced a “state intensity” value. This is
the basis for studies comparing results with the simplified fault free
calculations utilized in the FaultTree package. This could also represent a
stepping off point for incorporating Markov model results in ftree objects of
the FaultTree package.

 

### Matrix Exponentiation

For the dynamic probability of a single element failure over time it has been
noted that the exponential function is indeed the “ideal” integration of the
rate based partial differential. For more complex Markov models CARMS utilizes
Runge-Kutta, or Backwards Differentiation solutions as well as a stochastic
method for defining the dynamic probabilities of all states.

In the code examples provided in William Stewart’s text, a Matlab function expm
is used to establish an error measure over the other “simplified” integrations.
No matter how you slice it, even expm function implementations all require some
form of truncation of the infinite Taylor series. The R environment provides
multiple packages that include such expm function implementations. The most
basic of these is the Matrix package, which has been used to run validations on
the open models in the CARMS package examples.

It has further been found that execution of the expm function is fluid enough to
provide this as a further simulation method in the CARMS package.

 

 

 

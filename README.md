CARMSemu
========

 

This repository will contain progressive development utilizing the R Computing
environment https://www.r-project.org/ in an effort to emulate the functionality
of a CARMS program written by Paul Pukite and featured in his book “Modeling for
Reliability Analysis” ISBN: 978-0-780-33482-3. The reason for emulation is that
the CARMS program was written to run only in the Windows 3.1 operating system. R
provides a cross platform environment (Unix, Linux, Windows, macOS) and provides
for necessary upgrades as computer architectures progress.

The ultimate goal is to build an open source, emulated application package for
the R environment, perhaps named CARMS. The focus for now is on the back end
technical code that will generate matching results. Much attention must be given
to user interface and graphic representation of the Markov Models. This will all
take considerable development effort.

As a first step, a chained simulation algorithm has been written and tested
across a number of examples from the original CARMS distribution. Here a few of
these examples are demonstrated, with code that anyone can run in an R console.

jeep.R
------

![](images/jeep_diagram.jpg)

-   This model considers 2 Markov chains for modest comparison in one run

-   Initial states are 1 and 3, both considering 4 tires working

-   State 2 indicates failure after one of the 4 tires goes flat

-   State 4 considers that a spare tire has been deployed

-   Finally state 5 indicates failure after one of the remaining 3 original
    tires or the spare go flat

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/jeep.R")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](images/jeep.jpeg)

Execution of this simulation is slower than I would hope for. But this is still
only written in interpreted R core language, which is known to suffer given loop
functions with high cycles. Here, 5000 cycles seemed to be required to generate
pleasing smooth curves. In the future this simulation will be executed from
compiled C++ code with remarkably improved performance. I also suspect that
integration of the partial differential equations will generate smooth curves
more effectively.

 

Performance Queuing Simulation (percpuio)
-----------------------------------------

![](images/percpuio_diagram.jpg)

This model is based on 3 slots existing in a job queue for computer processing.
As the cpu processes a job the I/O system can place a new job into the queue.

In state 1 the queue is full with 3 jobs for the cpu to perform. The cpu can
perform one job at a time, so state 2 is arrived at where there are 2 jobs left
in the queue and one slot open. In state 2  the cpu can operate on a single job
or the I/O can refill the single open slot to alter the state. Since the cpu job
rate is somewhat higher than a single I/O rate there is a greater propensity to
move to state 3 where only one job is left in the queue. Since there are 2 slots
open at state 3, both of the available I/O units can be deployed to resupply the
queue. Finally, it is possible for the cpu to exhaust the job queue at state 4.
Since the 2 I/O units are available at state 4, refilling of job slots proceeds
and so there will be expected steady state performance over time.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/percpuio.R")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](images/percpuio.jpg)

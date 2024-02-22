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
in the queue and one slot open. In state 2 the cpu can operate on a single job
or the I/O can refill the single open slot to alter the state. Since the cpu job
rate is somewhat higher than a single I/O rate there is a greater propensity to
move to state 3 where only one job is left in the queue. Since there are 2 slots
open at state 3, both of the available I/O units can be deployed to resupply the
queue. Finally, it is possible for the cpu to exhaust the job queue at state 4.
Since the 2 I/O units are available at state 4, refilling of job slots proceeds
and so there will be expected steady state performance over time.

This script now calls on the Runge-Kutta integration algorithm to resolve the
system of ordinary differential equations for this model.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/percpuio.R")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](images/percpuio.jpg)

CARMS object development and diagram building.
----------------------------------------------

Up to this point example scripts have been executable on an R Console without
any package installations. These scripts have demonstrated back end calculation
capabilities and rudimentary graphical response to results.

One of the key characteristics of the CARMS application is the user preparation
of Markov diagrams defining the model that will eventually be simulated. In the
case of the original CARMS application the user involvement was intended to be
interactive with a graphical screen. For this R emulation a different approach
is to be utilized.

In R it is expected that the graphical diagram capabilities of package ‘diagram’
will be used. In order to demonstrate diagramming examples a new user to R would
have to install package diagram into their R system.

### CARMS object

It has been said that “everything in R is an object”. In the case of this CARMS
emulation the data defining each model is stored in a CARMS object. The CARMS
object for any example is generated through a series of script lines not unlike
the lines of original scripts contained in .mm files. The script lines are
generated in turn through a series of functions that will form the basis of a
CARMS package.

For diagram development it is only required to define the states. Part of this
definition is the placement and sizing of the state ellipse graphics on a
canvas. In order to simplify the placement of state graphic elements a flexible
grid system has been devised. The grid configuration is set in function
carms.make along with a title designation. Each state can be positioned to be
centered on a particular grid tile. The position for each state is defined by a
vector of c(grid_column, grid_row) in a call to carms.state. After definition of
states it is possible to call for the diagram to be drawn, such that alterations
to the script lines can be made on a trial and error basis.

 

 

### Installing package diagram

I must admit that this description assumes a user installation on Windows
(currently Windows 10 and 11 are common). Upon installation of R to these
operating systems a graphical user interface is provided called the R Console
(which is almost as terse as the old DOS environment). Unix, Linux and macOS
users are most likely more sophisticated and will install R along with helper
software such as R Studio, where an R Console is also present.

Since package ‘diagram’ is a long established member on the CRAN repository it
can be simply installed by selecting the console menu items Packages-\>Install
Package(s) at which time a mirror must be selected. (O-Cloud at the top of the
list always works best for me.) Then scroll down to ‘diagram’ and enter.

 

 

 

 

### Installing development package CARMS

Since the CARMS package is currently at its most formative stage, in order to
experience examples for the formation of graphical Markov diagrams it will be
necessary to install the development package of CARMS contained in this GitHub
repository.

The package file for installation on Windows is in the form of CARMS_x.x.x.zip.
This file is not intended to be unzipped in Windows as you might expect. Rather
this is the file to install into R from the console menu item
Packages-\>”Install package(s) from local files..” Assuming package ‘diagram’
has been installed, this installation should be complete and following
demonstrations will run. (For Linux or macOS users the installation file is of
the form CARMS_x.x.x.tar.gz) at this time there is no compilation required to
install the package.

As an example, following are the script lines that place the 3 states in example
Pa2Simpl.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/package/CARMS/R/carms.make.R")
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/package/CARMS/R/carms.state.R")

Pa2Simpl<- carms.make( title = "Parallel     Same failure rates")
  
PaSimpl<- carms.state(PaSimpl, prob=1, name="P1", size=7, position=c(2,6))
PaSimpl<- carms.state(PaSimpl, prob=0, name="P1", size=7, position=c(5,6))
PaSimpl<- carms.state(PaSimpl, prob=0, name="P1", size=7, position=c(8,6))

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

 

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

### jeep.R

-   This model considers 2 Markov chains for modest comparison in one run

-   Initial states are 1 and 3, both considering 4 tires working				

-   State 2 indicates failure after one of the 4 tires goes flat				

-   State 4 considers that a spare tire has been deployed				

-   Finally state 5 indicates failure after one of the remaining 3 original
    tires or the spare go flat

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/jto888/CARMSemu/main/examples/.R")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](images/jeep.jpeg)

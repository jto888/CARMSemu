del %1_*
R CMD build %1
R CMD check %1_* --as-cran
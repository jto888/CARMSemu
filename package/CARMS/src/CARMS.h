#ifndef _CARMS_H
#define _CARMS_H

#include <RcppArmadillo.h>
//#include <Rcpp.h>
#include <vector>
#include <memory>

#include "Simulation.h"

RcppExport SEXP ChainSim( SEXP, SEXP, SEXP, SEXP);


Rcpp::IntegerVector which(Rcpp::IntegerVector vecDup, int elem);
		
#endif
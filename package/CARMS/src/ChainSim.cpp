


#include "CARMS.h"


 SEXP ChainSim(SEXP states_in, SEXP tt_int, SEXP tt_float, SEXP control_in) {     
	using namespace Rcpp;
	
	Rcpp::List outlist;
	Rcpp::RNGScope Scope; 
/*	
	Environment base("package:base");
	Function SetSeed = base["set.seed"];
	int mySeed=1234;
	SetSeed(Named("seed",mySeed) );
*/
// Simulation code now moved into a class so that it can be created in (and destroyed from) memory using a smart pointer	
	std::unique_ptr<Simulation> SIM(new Simulation(states_in, tt_int, tt_float, control_in) );


outlist.push_back(Rcpp::wrap(SIM->outmat));

	 return(outlist);

}



#include "CARMS.h"

Rcpp::IntegerVector which(Rcpp::IntegerVector vecDup, int elem)  {
		using namespace Rcpp;
	Rcpp::IntegerVector vec_of_indices;
	for(int index = 0; index < vecDup.size(); index++) {
		if(vecDup.at(index) == elem) {
			vec_of_indices.push_back(index);
		}
	}
return vec_of_indices;
	
}
/*
> library(tools)
> package_native_routine_registration_skeleton("C:/Users/djs/Documents/GitHub/CARMSemu/package/CARMS")
*/
#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP ChainSim(SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"ChainSim", (DL_FUNC) &ChainSim, 4},
    {NULL, NULL, 0}
};

void R_init_CARMS(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}


void R_init_FaultTree(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

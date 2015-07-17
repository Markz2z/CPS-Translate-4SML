// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void x_63(void *z_141)
{
  int * x = (int *) ((int **)z_141)[3];
  int * k_67 = (int *) ((int **)z_141)[2];
  int * e_284 = (int *) ((int **)z_141)[1];
  int * x_154 = 99;
  int * k_141 = (int *) ((int **)k_67)[1];
  int * e_283 = (int *) ((int **)k_67)[2];
  int * k_142 = (int *) ((int **)k_141)[1];
  int * e_286 = (int *) ((int **)k_141)[2];

    int * z_142 = allocTuple(2);
  z_142[(int)2] = (int)x_154;
  z_142[(int)1] = (int)e_286;

  ((void * (*)())k_142)(z_142);
  
}


void ml_main()
{
  int * e_285 = allocTuple(0);
  int * x_153 = allocTuple(2);
  x_153[(int)2] = (int)e_285;
  x_153[(int)1] = (int)x_63;

  
  ml_exit (x_153);
  
}

int main ()
{
  ml_main ();
  return 0;
}


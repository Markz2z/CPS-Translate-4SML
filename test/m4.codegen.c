// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void x_71(void *z_158)
{
  int * y = (int *) ((int **)z_158)[3];
  int * k_76 = (int *) ((int **)z_158)[2];
  int * e_318 = (int *) ((int **)z_158)[1];
  int * x = (int *) ((int **)e_318)[1];
  int * k_158 = (int *) ((int **)k_76)[1];
  int * e_317 = (int *) ((int **)k_76)[2];
  int * k_160 = (int *) ((int **)k_158)[1];
  int * e_323 = (int *) ((int **)k_158)[2];

    int * z_159 = allocTuple(2);
  z_159[(int)2] = (int)x;
  z_159[(int)1] = (int)e_323;

  ((void * (*)())k_160)(z_159);
  
}


void x_70(void *z_160)
{
  int * x = (int *) ((int **)z_160)[3];
  int * k_75 = (int *) ((int **)z_160)[2];
  int * e_320 = (int *) ((int **)z_160)[1];
  int * e_322 = allocTuple(1);
  e_322[(int)1] = (int)x;
  int * x_176 = allocTuple(2);
  x_176[(int)2] = (int)e_322;
  x_176[(int)1] = (int)x_71;
  int * k_159 = (int *) ((int **)k_75)[1];
  int * e_319 = (int *) ((int **)k_75)[2];
  int * k_161 = (int *) ((int **)k_159)[1];
  int * e_324 = (int *) ((int **)k_159)[2];

    int * z_161 = allocTuple(2);
  z_161[(int)2] = (int)x_176;
  z_161[(int)1] = (int)e_324;

  ((void * (*)())k_161)(z_161);
  
}


void ml_main()
{
  int * e_321 = allocTuple(0);
  int * x_175 = allocTuple(2);
  x_175[(int)2] = (int)e_321;
  x_175[(int)1] = (int)x_70;

  
  ml_exit (x_175);
  
}

int main ()
{
  ml_main ();
  return 0;
}


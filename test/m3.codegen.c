// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void k_157(void *z_154)
{
  int * x_172 = (int *) ((int **)z_154)[2];
  int * e_312 = (int *) ((int **)z_154)[1];
  int * x_174 = (int *) ((int **)e_312)[1];
  int * x_173 = (int *) ((int **)e_312)[2];

  
  ml_exit (x_172);
  
}


void x_68(void *z_155)
{
  int * x = (int *) ((int **)z_155)[3];
  int * k_74 = (int *) ((int **)z_155)[2];
  int * e_310 = (int *) ((int **)z_155)[1];
  int * k_155 = (int *) ((int **)k_74)[1];
  int * e_309 = (int *) ((int **)k_74)[2];
  int * k_156 = (int *) ((int **)k_155)[1];
  int * e_314 = (int *) ((int **)k_155)[2];

    int * z_156 = allocTuple(2);
  z_156[(int)2] = (int)x;
  z_156[(int)1] = (int)e_314;

  ((void * (*)())k_156)(z_156);
  
}


void ml_main()
{
  int * e_313 = allocTuple(0);
  int * x_173 = allocTuple(2);
  x_173[(int)2] = (int)e_313;
  x_173[(int)1] = (int)x_68;
  int * x_174 = (int *)"hello";
  int * e_315 = allocTuple(2);
  e_315[(int)2] = (int)x_173;
  e_315[(int)1] = (int)x_174;
  int * k_73 = allocTuple(2);
  k_73[(int)2] = (int)e_315;
  k_73[(int)1] = (int)k_157;
  int * x_69 = (int *) ((int **)x_173)[1];
  int * e_316 = (int *) ((int **)x_173)[2];

    int * z_157 = allocTuple(3);
  z_157[(int)3] = (int)x_174;
  z_157[(int)2] = (int)e_316;
  z_157[(int)1] = (int)k_73;

  ((void * (*)())x_69)(z_157);
  
}

int main ()
{
  ml_main ();
  return 0;
}


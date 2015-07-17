// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void k_145(void *z_143)
{
  int * x_155 = (int *) ((int **)z_143)[2];
  int * e_290 = (int *) ((int **)z_143)[1];
  int * x_158 = (int *) ((int **)e_290)[1];
  int * x_156 = (int *) ((int **)e_290)[2];

  
  ml_exit (x_155);
  
}


void x_64(void *z_144)
{
  int * x = (int *) ((int **)z_144)[3];
  int * k_69 = (int *) ((int **)z_144)[2];
  int * e_288 = (int *) ((int **)z_144)[1];
  int * x_157 = (int *) ((int **)x)[1];
  int * k_143 = (int *) ((int **)k_69)[1];
  int * e_287 = (int *) ((int **)k_69)[2];
  int * k_144 = (int *) ((int **)k_143)[1];
  int * e_292 = (int *) ((int **)k_143)[2];

    int * z_145 = allocTuple(2);
  z_145[(int)2] = (int)x_157;
  z_145[(int)1] = (int)e_292;

  ((void * (*)())k_144)(z_145);
  
}


void ml_main()
{
  int * e_291 = allocTuple(0);
  int * x_156 = allocTuple(2);
  x_156[(int)2] = (int)e_291;
  x_156[(int)1] = (int)x_64;
  int * x_159 = (int *)"a";
  int * x_160 = (int *)"b";
  int * x_158 = allocTuple(2);
  x_158[(int)2] = (int)x_160;
  x_158[(int)1] = (int)x_159;
  int * e_293 = allocTuple(2);
  e_293[(int)2] = (int)x_156;
  e_293[(int)1] = (int)x_158;
  int * k_68 = allocTuple(2);
  k_68[(int)2] = (int)e_293;
  k_68[(int)1] = (int)k_145;
  int * x_65 = (int *) ((int **)x_156)[1];
  int * e_294 = (int *) ((int **)x_156)[2];

    int * z_146 = allocTuple(3);
  z_146[(int)3] = (int)x_158;
  z_146[(int)2] = (int)e_294;
  z_146[(int)1] = (int)k_68;

  ((void * (*)())x_65)(z_146);
  
}

int main ()
{
  ml_main ();
  return 0;
}


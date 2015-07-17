// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void k_151(void *z_147)
{
  int * x_163 = (int *) ((int **)z_147)[2];
  int * e_299 = (int *) ((int **)z_147)[1];
  int * k_71 = (int *) ((int **)e_299)[1];
  int * x_164 = (int *) ((int **)e_299)[2];
  int * k_70 = (int *) ((int **)e_299)[3];
  int * x_170 = (int *)"B";
  int * x_171 = (int *)"BB";
  int * x_169 = allocTuple(2);
  x_169[(int)2] = (int)x_171;
  x_169[(int)1] = (int)x_170;
  int * k_147 = (int *) ((int **)k_70)[1];
  int * e_296 = (int *) ((int **)k_70)[2];
  int * k_152 = (int *) ((int **)k_147)[1];
  int * e_306 = (int *) ((int **)k_147)[2];

    int * z_148 = allocTuple(2);
  z_148[(int)2] = (int)x_169;
  z_148[(int)1] = (int)e_306;

  ((void * (*)())k_152)(z_148);
  
}


void k_149(void *z_149)
{
  int * x_162 = (int *) ((int **)z_149)[2];
  int * e_300 = (int *) ((int **)z_149)[1];
  int * x_164 = (int *) ((int **)e_300)[1];
  int * k_70 = (int *) ((int **)e_300)[2];
  int * x_167 = (int *)"A";
  int * x_168 = (int *)"AA";
  int * x_166 = allocTuple(2);
  x_166[(int)2] = (int)x_168;
  x_166[(int)1] = (int)x_167;
  int * k_146 = (int *) ((int **)k_70)[1];
  int * e_295 = (int *) ((int **)k_70)[2];
  int * k_150 = (int *) ((int **)k_146)[1];
  int * e_304 = (int *) ((int **)k_146)[2];

    int * z_150 = allocTuple(2);
  z_150[(int)2] = (int)x_166;
  z_150[(int)1] = (int)e_304;

  ((void * (*)())k_150)(z_150);
  
}


void k_148(void *z_151)
{
  int * x_161 = (int *) ((int **)z_151)[2];
  int * e_301 = (int *) ((int **)z_151)[1];
  int * x_164 = (int *) ((int **)e_301)[1];

  
  ml_exit (x_161);
  
}


void ml_main()
{
  int * x_165 = (int *)"z";
  int * x_164 = allocTag(1);
  x_164[(int)1] = (int)x_165;
  int * e_302 = allocTuple(1);
  e_302[(int)1] = (int)x_164;
  int * k_70 = allocTuple(2);
  k_70[(int)2] = (int)e_302;
  k_70[(int)1] = (int)k_148;
  int * e_303 = allocTuple(2);
  e_303[(int)2] = (int)k_70;
  e_303[(int)1] = (int)x_164;
  int * k_71 = allocTuple(2);
  k_71[(int)2] = (int)e_303;
  k_71[(int)1] = (int)k_149;
  int * e_305 = allocTuple(3);
  e_305[(int)3] = (int)k_70;
  e_305[(int)2] = (int)x_164;
  e_305[(int)1] = (int)k_71;
  int * k_72 = allocTuple(2);
  k_72[(int)2] = (int)e_305;
  k_72[(int)1] = (int)k_151;
  int * k_153 = (int *) ((int **)k_71)[1];
  int * e_307 = (int *) ((int **)k_71)[2];
  int * k_154 = (int *) ((int **)k_72)[1];
  int * e_308 = (int *) ((int **)k_72)[2];

  
  if(x_164[0]==1){
int *x_66 = (int *)(x_164[1]);
  int * z_152 = allocTuple(2);
  z_152[(int)2] = (int)x_66;
  z_152[(int)1] = (int)e_307;

  ((void * (*)())k_153)(z_152);
  }
  else if(x_164[0]==2){
int *x_67 = (int *)(x_164[1]);
  int * z_153 = allocTuple(2);
  z_153[(int)2] = (int)x_67;
  z_153[(int)1] = (int)e_308;

  ((void * (*)())k_154)(z_153);
  }
  
}

int main ()
{
  ml_main ();
  return 0;
}


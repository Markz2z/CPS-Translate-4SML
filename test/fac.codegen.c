// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void k_170(void *z_162)
{
  int * x_183 = (int *) ((int **)z_162)[2];
  int * e_329 = (int *) ((int **)z_162)[1];
  int * x_184 = (int *) ((int **)e_329)[1];
  int * f = (int *) ((int **)e_329)[2];
  int * k_78 = (int *) ((int **)e_329)[3];
  int * x = (int *) ((int **)e_329)[4];
  int * x_182 = (int)x + (int)x_183;
  int * k_164 = (int *) ((int **)k_78)[1];
  int * e_327 = (int *) ((int **)k_78)[2];
  int * k_171 = (int *) ((int **)k_164)[1];
  int * e_345 = (int *) ((int **)k_164)[2];

    int * z_163 = allocTuple(2);
  z_163[(int)2] = (int)x_182;
  z_163[(int)1] = (int)e_345;

  ((void * (*)())k_171)(z_163);
  
}


void k_169(void *z_164)
{
  int * x_180 = (int *) ((int **)z_164)[2];
  int * e_332 = (int *) ((int **)z_164)[1];
  int * k_79 = (int *) ((int **)e_332)[1];
  int * x = (int *) ((int **)e_332)[2];
  int * f = (int *) ((int **)e_332)[3];
  int * k_78 = (int *) ((int **)e_332)[4];
  int * x_185 = 1;
  int * x_184 = x - x_185;
  int * e_344 = allocTuple(4);
  e_344[(int)4] = (int)x;
  e_344[(int)3] = (int)k_78;
  e_344[(int)2] = (int)f;
  e_344[(int)1] = (int)x_184;
  int * k_81 = allocTuple(2);
  k_81[(int)2] = (int)e_344;
  k_81[(int)1] = (int)k_170;
  int * x_76 = (int *) ((int **)f)[1];
  int * e_346 = (int *) ((int **)f)[2];

    int * z_165 = allocTuple(3);
  z_165[(int)3] = (int)x_184;
  z_165[(int)2] = (int)e_346;
  z_165[(int)1] = (int)k_81;

  ((void * (*)())x_76)(z_165);
  
}


void k_167(void *z_166)
{
  int * x_179 = (int *) ((int **)z_166)[2];
  int * e_333 = (int *) ((int **)z_166)[1];
  int * x = (int *) ((int **)e_333)[1];
  int * f = (int *) ((int **)e_333)[2];
  int * k_78 = (int *) ((int **)e_333)[3];
  int * x_181 = 0;
  int * k_163 = (int *) ((int **)k_78)[1];
  int * e_326 = (int *) ((int **)k_78)[2];
  int * k_168 = (int *) ((int **)k_163)[1];
  int * e_342 = (int *) ((int **)k_163)[2];

    int * z_167 = allocTuple(2);
  z_167[(int)2] = (int)x_181;
  z_167[(int)1] = (int)e_342;

  ((void * (*)())k_168)(z_167);
  
}


void k_165(void *z_168)
{
  int * x_178 = (int *) ((int **)z_168)[2];
  int * e_334 = (int *) ((int **)z_168)[1];
  int * x = (int *) ((int **)e_334)[1];
  int * f = (int *) ((int **)e_334)[2];
  int * k_77 = (int *) ((int **)e_334)[3];
  int * k_162 = (int *) ((int **)k_77)[1];
  int * e_325 = (int *) ((int **)k_77)[2];
  int * k_166 = (int *) ((int **)k_162)[1];
  int * e_340 = (int *) ((int **)k_162)[2];

    int * z_169 = allocTuple(2);
  z_169[(int)2] = (int)x_178;
  z_169[(int)1] = (int)e_340;

  ((void * (*)())k_166)(z_169);
  
}


void k_174(void *z_170)
{
  int * x_186 = (int *) ((int **)z_170)[2];
  int * e_336 = (int *) ((int **)z_170)[1];
  int * x_187 = (int *) ((int **)e_336)[1];
  int * f = (int *) ((int **)e_336)[2];

  
  ml_exit (x_186);
  
}


void x_75(void *z_171)
{
  int * x = (int *) ((int **)z_171)[3];
  int * e_337 = (int *) ((int **)z_171)[2];
  int * k_77 = (int *) ((int **)z_171)[1];
  int * f = allocTuple(2);
  f[(int)2] = (int)e_337;
  f[(int)1] = (int)x_75;
  int * e_339 = allocTuple(3);
  e_339[(int)3] = (int)k_77;
  e_339[(int)2] = (int)f;
  e_339[(int)1] = (int)x;
  int * k_78 = allocTuple(2);
  k_78[(int)2] = (int)e_339;
  k_78[(int)1] = (int)k_165;
  int * e_341 = allocTuple(3);
  e_341[(int)3] = (int)k_78;
  e_341[(int)2] = (int)f;
  e_341[(int)1] = (int)x;
  int * k_79 = allocTuple(2);
  k_79[(int)2] = (int)e_341;
  k_79[(int)1] = (int)k_167;
  int * e_343 = allocTuple(4);
  e_343[(int)4] = (int)k_78;
  e_343[(int)3] = (int)f;
  e_343[(int)2] = (int)x;
  e_343[(int)1] = (int)k_79;
  int * k_80 = allocTuple(2);
  k_80[(int)2] = (int)e_343;
  k_80[(int)1] = (int)k_169;
  int * x_74 = 0;
  int * k_172 = (int *) ((int **)k_79)[1];
  int * e_347 = (int *) ((int **)k_79)[2];
  int * k_173 = (int *) ((int **)k_80)[1];
  int * e_348 = (int *) ((int **)k_80)[2];

  
  if (x=0)
{  int * z_172 = allocTuple(2);
  z_172[(int)2] = (int)x_72;
  z_172[(int)1] = (int)e_347;

  ((void * (*)())k_172)(z_172);
  }
else
{  int * z_173 = allocTuple(2);
  z_173[(int)2] = (int)x_73;
  z_173[(int)1] = (int)e_348;

  ((void * (*)())k_173)(z_173);
  }
  
}


void ml_main()
{
  int * e_338 = allocTuple(0);
  int * f = allocTuple(2);
  f[(int)2] = (int)e_338;
  f[(int)1] = (int)x_75;
  int * x_187 = 100;
  int * e_349 = allocTuple(2);
  e_349[(int)2] = (int)f;
  e_349[(int)1] = (int)x_187;
  int * k_82 = allocTuple(2);
  k_82[(int)2] = (int)e_349;
  k_82[(int)1] = (int)k_174;
  int * x_77 = (int *) ((int **)f)[1];
  int * e_350 = (int *) ((int **)f)[2];

    int * z_174 = allocTuple(3);
  z_174[(int)3] = (int)x_187;
  z_174[(int)2] = (int)e_350;
  z_174[(int)1] = (int)k_82;

  ((void * (*)())x_77)(z_174);
  
}

int main ()
{
  ml_main ();
  return 0;
}


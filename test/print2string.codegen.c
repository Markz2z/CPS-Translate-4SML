// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void k_183(void *z_175)
{
  int * x_196 = (int *) ((int **)z_175)[2];
  int * e_355 = (int *) ((int **)z_175)[1];
  int * x_197 = (int *) ((int **)e_355)[1];
  int * f = (int *) ((int **)e_355)[2];
  int * k_84 = (int *) ((int **)e_355)[3];
  int * x = (int *) ((int **)e_355)[4];
  int * x_195 = (int)x + (int)x_196;
  int * k_177 = (int *) ((int **)k_84)[1];
  int * e_353 = (int *) ((int **)k_84)[2];
  int * k_184 = (int *) ((int **)k_177)[1];
  int * e_371 = (int *) ((int **)k_177)[2];

    int * z_176 = allocTuple(2);
  z_176[(int)2] = (int)x_195;
  z_176[(int)1] = (int)e_371;

  ((void * (*)())k_184)(z_176);
  
}


void k_182(void *z_177)
{
  int * x_193 = (int *) ((int **)z_177)[2];
  int * e_358 = (int *) ((int **)z_177)[1];
  int * k_85 = (int *) ((int **)e_358)[1];
  int * x = (int *) ((int **)e_358)[2];
  int * f = (int *) ((int **)e_358)[3];
  int * k_84 = (int *) ((int **)e_358)[4];
  int * x_198 = 1;
  int * x_197 = x - x_198;
  int * e_370 = allocTuple(4);
  e_370[(int)4] = (int)x;
  e_370[(int)3] = (int)k_84;
  e_370[(int)2] = (int)f;
  e_370[(int)1] = (int)x_197;
  int * k_87 = allocTuple(2);
  k_87[(int)2] = (int)e_370;
  k_87[(int)1] = (int)k_183;
  int * x_82 = (int *) ((int **)f)[1];
  int * e_372 = (int *) ((int **)f)[2];

    int * z_178 = allocTuple(3);
  z_178[(int)3] = (int)x_197;
  z_178[(int)2] = (int)e_372;
  z_178[(int)1] = (int)k_87;

  ((void * (*)())x_82)(z_178);
  
}


void k_180(void *z_179)
{
  int * x_192 = (int *) ((int **)z_179)[2];
  int * e_359 = (int *) ((int **)z_179)[1];
  int * x = (int *) ((int **)e_359)[1];
  int * f = (int *) ((int **)e_359)[2];
  int * k_84 = (int *) ((int **)e_359)[3];
  int * x_194 = 0;
  int * k_176 = (int *) ((int **)k_84)[1];
  int * e_352 = (int *) ((int **)k_84)[2];
  int * k_181 = (int *) ((int **)k_176)[1];
  int * e_368 = (int *) ((int **)k_176)[2];

    int * z_180 = allocTuple(2);
  z_180[(int)2] = (int)x_194;
  z_180[(int)1] = (int)e_368;

  ((void * (*)())k_181)(z_180);
  
}


void k_178(void *z_181)
{
  int * x_191 = (int *) ((int **)z_181)[2];
  int * e_360 = (int *) ((int **)z_181)[1];
  int * x = (int *) ((int **)e_360)[1];
  int * f = (int *) ((int **)e_360)[2];
  int * k_83 = (int *) ((int **)e_360)[3];
  int * k_175 = (int *) ((int **)k_83)[1];
  int * e_351 = (int *) ((int **)k_83)[2];
  int * k_179 = (int *) ((int **)k_175)[1];
  int * e_366 = (int *) ((int **)k_175)[2];

    int * z_182 = allocTuple(2);
  z_182[(int)2] = (int)x_191;
  z_182[(int)1] = (int)e_366;

  ((void * (*)())k_179)(z_182);
  
}


void k_187(void *z_183)
{
  int * x_199 = (int *) ((int **)z_183)[2];
  int * e_362 = (int *) ((int **)z_183)[1];
  int * x_200 = (int *) ((int **)e_362)[1];
  int * f = (int *) ((int **)e_362)[2];
  int * x_189 =  ml_int2string(x_199);;
  int * x_188 =  ml_print(x_189);;

  
  ml_exit (x_188);
  
}


void x_81(void *z_184)
{
  int * x = (int *) ((int **)z_184)[3];
  int * e_363 = (int *) ((int **)z_184)[2];
  int * k_83 = (int *) ((int **)z_184)[1];
  int * f = allocTuple(2);
  f[(int)2] = (int)e_363;
  f[(int)1] = (int)x_81;
  int * e_365 = allocTuple(3);
  e_365[(int)3] = (int)k_83;
  e_365[(int)2] = (int)f;
  e_365[(int)1] = (int)x;
  int * k_84 = allocTuple(2);
  k_84[(int)2] = (int)e_365;
  k_84[(int)1] = (int)k_178;
  int * e_367 = allocTuple(3);
  e_367[(int)3] = (int)k_84;
  e_367[(int)2] = (int)f;
  e_367[(int)1] = (int)x;
  int * k_85 = allocTuple(2);
  k_85[(int)2] = (int)e_367;
  k_85[(int)1] = (int)k_180;
  int * e_369 = allocTuple(4);
  e_369[(int)4] = (int)k_84;
  e_369[(int)3] = (int)f;
  e_369[(int)2] = (int)x;
  e_369[(int)1] = (int)k_85;
  int * k_86 = allocTuple(2);
  k_86[(int)2] = (int)e_369;
  k_86[(int)1] = (int)k_182;
  int * x_80 = 0;
  int * k_185 = (int *) ((int **)k_85)[1];
  int * e_373 = (int *) ((int **)k_85)[2];
  int * k_186 = (int *) ((int **)k_86)[1];
  int * e_374 = (int *) ((int **)k_86)[2];

  
  if (x=0)
{  int * z_185 = allocTuple(2);
  z_185[(int)2] = (int)x_78;
  z_185[(int)1] = (int)e_373;

  ((void * (*)())k_185)(z_185);
  }
else
{  int * z_186 = allocTuple(2);
  z_186[(int)2] = (int)x_79;
  z_186[(int)1] = (int)e_374;

  ((void * (*)())k_186)(z_186);
  }
  
}


void ml_main()
{
  int * e_364 = allocTuple(0);
  int * f = allocTuple(2);
  f[(int)2] = (int)e_364;
  f[(int)1] = (int)x_81;
  int * x_200 = 100;
  int * e_375 = allocTuple(2);
  e_375[(int)2] = (int)f;
  e_375[(int)1] = (int)x_200;
  int * k_88 = allocTuple(2);
  k_88[(int)2] = (int)e_375;
  k_88[(int)1] = (int)k_187;
  int * x_83 = (int *) ((int **)f)[1];
  int * e_376 = (int *) ((int **)f)[2];

    int * z_187 = allocTuple(3);
  z_187[(int)3] = (int)x_200;
  z_187[(int)2] = (int)e_376;
  z_187[(int)1] = (int)k_88;

  ((void * (*)())x_83)(z_187);
  
}

int main ()
{
  ml_main ();
  return 0;
}


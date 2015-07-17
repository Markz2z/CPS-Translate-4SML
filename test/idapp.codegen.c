//An example result for Test.m3

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

typedef void (*ty_fun_ptr)();
typedef int *ty_int_ptr;

void ml_exit (void *x)
{
  //You can uncomment this to help testing.
  //printf(x);
  exit (0);
}

void x_4(void *x_5)
{
  ty_int_ptr env_3 = (ty_int_ptr)((ty_int_ptr)x_5)[1];
  ty_int_ptr x_0 = (ty_int_ptr)((ty_int_ptr)x_5)[2];

  
  ml_exit (x_0);
  
}


void x_3(void *x_6)
{
  ty_int_ptr env_0 = (ty_int_ptr)((ty_int_ptr)x_6)[1];
  ty_int_ptr k_1 = (ty_int_ptr)((ty_int_ptr)x_6)[2];
  ty_int_ptr x = (ty_int_ptr)((ty_int_ptr)x_6)[3];
  ty_int_ptr k_2 = (ty_int_ptr)((ty_int_ptr)k_1)[1];
  ty_int_ptr env_1 = (ty_int_ptr)((ty_int_ptr)k_1)[2];

    ty_int_ptr x_7 = allocTuple(2);
  x_7[(int)1] = (int)env_1;
  x_7[(int)2] = (int)x;

  ((ty_fun_ptr)k_2)(x_7);
  
}


void ml_main()
{
  ty_int_ptr env_4 = 0;
  ty_int_ptr x_1 = allocTuple(2);
  x_1[(int)1] = (int)x_3;
  x_1[(int)2] = (int)env_4;
  ty_int_ptr x_2 = (ty_int_ptr)"hello";
  ty_int_ptr env_5 = 0;
  ty_int_ptr k_0 = allocTuple(2);
  k_0[(int)1] = (int)x_4;
  k_0[(int)2] = (int)env_5;
  ty_int_ptr k_3 = (ty_int_ptr)((ty_int_ptr)x_1)[1];
  ty_int_ptr env_2 = (ty_int_ptr)((ty_int_ptr)x_1)[2];

    ty_int_ptr x_8 = allocTuple(3);
  x_8[(int)1] = (int)env_2;
  x_8[(int)2] = (int)k_0;
  x_8[(int)3] = (int)x_2;

  ((ty_fun_ptr)k_3)(x_8);
  
}

int main ()
{
  ml_main ();
  return 0;
}


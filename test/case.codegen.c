//An example result for Test.m2

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

void x_38(void *x_39)
{
  ty_int_ptr env_20 = (ty_int_ptr)((ty_int_ptr)x_39)[1];
  ty_int_ptr y = (ty_int_ptr)((ty_int_ptr)x_39)[2];
  ty_int_ptr k_11 = (ty_int_ptr)((ty_int_ptr)env_20)[1];
  ty_int_ptr x_33 = (ty_int_ptr)"b";
  ty_int_ptr k_15 = (ty_int_ptr)((ty_int_ptr)k_11)[1];
  ty_int_ptr env_17 = (ty_int_ptr)((ty_int_ptr)k_11)[2];

    ty_int_ptr x_40 = allocTuple(2);
  x_40[(int)1] = (int)env_17;
  x_40[(int)2] = (int)x_33;

  ((ty_fun_ptr)k_15)(x_40);
  
}


void x_37(void *x_41)
{
  ty_int_ptr env_21 = (ty_int_ptr)((ty_int_ptr)x_41)[1];
  ty_int_ptr x = (ty_int_ptr)((ty_int_ptr)x_41)[2];
  ty_int_ptr k_11 = (ty_int_ptr)((ty_int_ptr)env_21)[1];
  ty_int_ptr k_14 = (ty_int_ptr)((ty_int_ptr)k_11)[1];
  ty_int_ptr env_16 = (ty_int_ptr)((ty_int_ptr)k_11)[2];

    ty_int_ptr x_42 = allocTuple(2);
  x_42[(int)1] = (int)env_16;
  x_42[(int)2] = (int)x;

  ((ty_fun_ptr)k_14)(x_42);
  
}


void x_36(void *x_43)
{
  ty_int_ptr env_22 = (ty_int_ptr)((ty_int_ptr)x_43)[1];
  ty_int_ptr x_30 = (ty_int_ptr)((ty_int_ptr)x_43)[2];

  
  ml_exit (x_30);
  
}


void ml_main()
{
  ty_int_ptr x_32 = (ty_int_ptr)"a";
  ty_int_ptr x_31 = allocTag(1);
  x_31[(int)1] = (int)x_32;
  ty_int_ptr env_23 = 0;
  ty_int_ptr k_11 = allocTuple(2);
  k_11[(int)1] = (int)x_36;
  k_11[(int)2] = (int)env_23;
  ty_int_ptr env_24 = allocTuple(1);
  env_24[(int)1] = (int)k_11;
  ty_int_ptr k_12 = allocTuple(2);
  k_12[(int)1] = (int)x_37;
  k_12[(int)2] = (int)env_24;
  ty_int_ptr env_25 = allocTuple(1);
  env_25[(int)1] = (int)k_11;
  ty_int_ptr k_13 = allocTuple(2);
  k_13[(int)1] = (int)x_38;
  k_13[(int)2] = (int)env_25;
  ty_int_ptr k_16 = (ty_int_ptr)((ty_int_ptr)k_12)[1];
  ty_int_ptr env_18 = (ty_int_ptr)((ty_int_ptr)k_12)[2];
  ty_int_ptr k_17 = (ty_int_ptr)((ty_int_ptr)k_13)[1];
  ty_int_ptr env_19 = (ty_int_ptr)((ty_int_ptr)k_13)[2];

  
  void *x_34=(void *)((int *)x_31)[1];
void *x_35=(void *)((int *)x_31)[1];
if(((int *)x_31)[0]==1){
  ty_int_ptr x_44 = allocTuple(2);
  x_44[(int)1] = (int)env_18;
  x_44[(int)2] = (int)x_34;

  ((ty_fun_ptr)k_16)(x_44);
  ;}
else if(((int *)x_31)[0]==2){
  ty_int_ptr x_45 = allocTuple(2);
  x_45[(int)1] = (int)env_19;
  x_45[(int)2] = (int)x_35;

  ((ty_fun_ptr)k_17)(x_45);
  ;}

  
}

int main ()
{
  ml_main ();
  return 0;
}


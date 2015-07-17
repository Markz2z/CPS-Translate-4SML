// Compiler auto-generated.

#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

void ml_exit (void *x)
{
  exit (0);
}

void ml_main()
{
  int * x_152 = (int *)"hello, world\n";
  int * x_151 =  ml_print(x_152);;

  
  ml_exit (x_151);
  
}

int main ()
{
  ml_main ();
  return 0;
}


#include <stdio.h>
#include <stdlib.h>

char* ml_int2string (int i)
{
  char* a=malloc(10*sizeof(char));
  char* p = a+9;
  int neg = 0;
  *p = '\0';
  p--;
  if(i==0) {
    *p = '0';
    return p;
  }
  if(i<0) {
    neg = 1;
    i = 0 -i;
  }
  while(i>0){
    *p = '0'+ (i%10);
    p--;
    i = i/10;
  }
  if (neg){
    *p= '-';
    return p;
  }
  p++;
  return p;
}



int ml_print (const char *s)
{
  return printf ("%s", s);
}

void *allocTuple (int numFields)
{
  //TODO: Exercise 4, Task1, finish the allocTuple function.
  //1)allocate memory space for the structure.
  //2)initialize the first 4kb with length info.
  //3)return the pointer.
  void * tuple = (void *)malloc((numFields+1)*sizeof(int));
  *((int *)tuple) = numFields;
  return tuple;
}

void *allocTag (int tag)
{
  //TODO:Exercise 4, Task2, finish the allocTag function.
  //1)allocate memory space for the structure.
  //2)initialize the first 4kb with the tag value.
  //3)return the pointer.
  void * tuple = (void *)malloc(2*sizeof(int));
  *((int *)tuple) = tag;
  return tuple;
}


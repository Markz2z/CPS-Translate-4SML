#ifndef RUNTIME_H
#define RUNTIME_H


int ml_print (const char *);
char *ml_int2string (int i);

void *allocTuple (int);
void *allocTag (int);

#endif

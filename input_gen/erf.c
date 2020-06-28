#include <math.h>
#include <stdio.h>
#include <stdlib.h>
/* 

compute erf(x) where x is read from stdin

*/
int main(void)
{
  double x;
  while(fscanf(stdin,"%lf",&x)==1)
    fprintf(stdout,"%.15e\n",erf(x));
  return 0;
}

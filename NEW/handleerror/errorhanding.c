#include<stdio.h>
void report_error(char ch,int line)
{
fprintf(stderr,"Lexical error:Unreognized character '%c' at line %d\n",ch,line);
}

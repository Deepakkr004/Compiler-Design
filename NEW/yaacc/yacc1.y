%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUMBER 
%left '+' '-'
%left '*' '/'

%%
expr:expr '+' expr { printf( "Result: %d\n",$1+$3);}
    |expr '-' expr { printf( "Result: %d\n",$1-$3);}
    |expr '*' expr { printf( "Result: %d\n",$1*$3);}
    |expr '/' expr { printf( "Result: %d\n",$1/$3);}
    |NUMBER		{$$ = $1;}
    ;
%%

int main()
{
printf("enter an arithmetic expression:\n");
yyparse();
return 0;
}

int yyerror(const char*msg){
fprintf(stderr,"Error : %s \n",msg);
return 0;
} 

%{
#include<stdio.h>
#include<stdlib.h>
%}

/* Declare tokens */
%token NUMBER
%token EOL
/* Define precedence to help resolve shift-reduce conflicts*/
%left '+' '-'
%left '*' '/'
%%
input:
	/*empty*/
	| input line
	;
	
line:
	 expr EOL	{printf("Result = %d\n", $1);}
	|EOL		{ /* blank line */}
	;
	
expr:
	NUMBER		{ $$=$1;}
      |expr '+' expr	{ $$=$1+$3;}
      |expr '-' expr	{ $$=$1-$3;}
      |expr '*' expr	{$$=$1*$3;}
      |expr '/' expr    {
      				if($3==0){
      				yyerror("division by zero");
      				$$=0;
      			     }else{
      			     $$$=$1/$3;
      			     }
      			}
     | '(' expr ')'    { $$= $2;}
     ;
%%
int main (void){
printf("Enter an expression (Ctrl-D to exit):\n");
yyparser();
return 0;
}

int yyerror(char *s){
	fprintf(stderr,"Error:%s\n",s);
	return 0;
}
      


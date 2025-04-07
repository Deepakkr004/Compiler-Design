%{
//#include<y.tab.h>
%}
%%
-[0-9]+ printf("Negative Integer");
\+?[0-9]+ printf("Positive Integer");
, printf("Comma");
%%
extern int yylex();
int yywrap()
{ return (1);
}
main(){
while (yylex());
}
	

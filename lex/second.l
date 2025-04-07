%{
/* #include "y.tab.h" */
%}
D           [0-9]
L           [a-zA-Z]
B           [\t]*
%%
-{D}+        printf("negative integer");
\+?{D}+      printf("positive integer");
-0.{D}+      printf("negative fraction,no whole number part");
G{L}*        printf("may have a G word here");
rail{B}road  printf("railroad is one word");
crook        printf("crimial");
%%

extern int yywrap();
int yywrap()
{
	return (1);
}

main(){
while(yylex());
}


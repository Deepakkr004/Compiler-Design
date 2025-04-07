%{
/*#include *y.tab.h* */
/* LT,LE,EQ,NE,GT,GE,IF,THEN,ELSE,ID,NUMBER,RELOP,yylval */
%}
/* REGULAR DEFINITIONS */
delim       [ \t\n]
ws          {delim}+
letter      [A-Za-z]
digit        [0-9]
id          {letter}({letter}|{digit})*
number      {digit}+(\.{digit}+)?(E[+\-]?{digit}+)?

%%
{ws}        {/* no action and no return */}
if          {printf("IF is lexed");}
then        {printf("THEN is lexed");}
else        { printf("ELSE is lexed");}
"<"           { printf("< is lexed");}
"<="        {return;}
"="         {return;}
"<>"        {return;}
">"         {return;}
">="         {return;}
%%
extern int yylex();
int yywrap()
{
return (1);
}
void main()
{
while(yylex());
}

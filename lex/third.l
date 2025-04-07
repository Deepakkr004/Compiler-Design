%{
/* #include "y.tab.h" */
/* LT, LE, EQ, NE, GT, GE, IF, THEN, ELSE, ID, NUMBER, RELOP, yylavl */
%}

 /* regular definitions */
delim       [\t\n]
ws           {delim}+
letter       [A-Za-z]
digit        [0-9]
id           {letter}{{letter}{digit}}*
number       {digit}+{\.{digit}+}?{E[+\-]?{digit}+}?

%%
{ws}         {/* no action and no return */}
if           	{printf("IF is lexed\n");}
then            {printf("THEN is lexed\n");}
else           	{printf("ELSE is lexed\n");}
naveen		{printf("NAVEEN is lexed\n");}
deepak		{printf("Sorry we can't lexed him.\n");}
"<"		{printf("< is lexed\n");}
"<="		{return ;}
"="		{return ;}
"<>"		{return ;}
">"		{return ;}
">="		{return ;}

%%

%{
#include<stdio.h>
#include<Symbol_Table.c>

extern int yylineno;
%}

%option noyywrap

DIGIT	[0-9]
ID	[a-zA-Z_][a-zA-Z0-9]*
KEYWORD	"int"|"float"|"char"|"if"|"else"|"while"|"return"

%%

{KEYWORD}	{printf("Keyword: %s\n",yytext);}
{ID}		{
			if(search(yytext) == 0) {
				insert(yytext, "Identifier");
				printf("Identifier: %s(added to symbol table\n", yytext);
			}else{
				printf("Identifier: %s(already in symbol table\n", yytext);
			}
		}
{DIGIT}		{printf("Number: %s\n",yytext);} 

[ \t\n]		;
		{printf("Unknown character: %s\n",yytext);} 

%%

int main() {
	printf("Enter the input:\n");
	yylex();
	display();
	return 0;
}

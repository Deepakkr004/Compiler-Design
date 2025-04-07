%{
#include<stdio.h>
#include "error_handling.h"
%}

%%
[\t\n]+		;//Ignore whitespace
[a-zA-Z_][a-zA-Z0-9_]*   printf("Identifier:%s\n",yytext);
[0-9]+			printf("Number:%s\n",yytext);
"=="|"!="|"<="|">="|"<"|">"|"="|"+"|"-"|"*"|"/" printf("Operator:%s\n",yytext);
"("|")"|"{"|"}"|"["|"]"|";"|"," printf("Delimiter:%s\",yytext);
.		report_error(yytext[0],yylineno);
%%
int main(int argc,char ** argv)
{
if(argc!=2)
{
fprintf(stderr,"Usage:%s<inputFile>\n",argv[0]);
return 1;
}
FILE*file=fopen(argv[1],'r');
if(!file)
{
perror("Error opening file");
return 1;
}

yyin=file;
yylex();
fclose(file);
return 0;
}

/*
%{
#include <stdio.h>
#include "error_handling.h"
%}

%%
[\t\n]+            ; // Ignore whitespace
[a-zA-Z_][a-zA-Z0-9_]*   printf("Identifier: %s\n", yytext);
[0-9]+                  printf("Number: %s\n", yytext);
"=="|"!="|"<="|">="|"<"|">"|"="|"+"|"-"|"*"|"/" printf("Operator: %s\n", yytext);
"("|")"|"{"|"}"|"["|"]"|";"|"," printf("Delimiter: %s\n", yytext);
.                   report_error(yytext[0], yylineno);
%%

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s <inputFile>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");  // Use double quotes here, not single quotes
    if (!file)
    {
        perror("Error opening file");
        return 1;
    }

    yyin = file;
    yylex();
    fclose(file);
    return 0;
}
*/

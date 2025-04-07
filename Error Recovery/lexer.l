%{
#include<stdio.h>
#include"error_handling.h"
%}

%%
[ \t\n]+	;
[a-zA-Z_][a-zA-Z0-9_]*	printf("Identifier: %s\n", yytext);
[0-9]+		printf("Number: %s\n", yytext);
"=="|"!="|"<="|">="|"<"|">"|"="|"+"|"-"|"*"|"/"		printf("Operators: %s\n", yytext);
"("|")"|"{"|"}"|"["|"]"|";"|","		printf("Delimiter: %s\n", yytext);
. 	report_error(yytext[0], yylineno);
%%

int main(int argc, char **argv){
	if (argc !=2){
		fprintf(stderr,"Usage: %s <input_file>\n",argv[0]);
		return 1;
	}
	
	FILE *file = fopen(argv[1], "r");
	if (!file) {
		perror("Error opening file");
		return 1;
	}
	
	yyin = file;
	yylex();
	fclose(file);
	return 0;
}

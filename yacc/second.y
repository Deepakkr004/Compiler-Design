%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE double
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%
line: expr '\n' { printf("%g\n", $1); }
     | line '\n'
     | /* Epsilon */
     ;

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')' { $$ = $2; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | NUMBER
    ;
%%
int yylex() {
    int c;
    while ((c = getchar()) == ' ' || c == '\t' || c == '\n');
    if ((c == '.') || isdigit(c)) {
        ungetc(c, stdin); // Put the character back
        scanf("%lf", &yylval); // Read the number
        return NUMBER;
    }
    return c;
}

int main() {
    yyparse();
    return 0;
}

void yyerror() {
    printf("Error\n");
}


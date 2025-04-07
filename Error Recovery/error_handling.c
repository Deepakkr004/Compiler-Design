#include<stdio.h>

void report_error(char ch, int line){
	fprintf(stderr, "Lexical error: Unrecognized character '%c' At line %d\n", ch, line);
}

#include<stdio.h>
#include<ctype.h>
#include<string.h>

int isDelimiter(char ch) {
	return (ch == ' ' || ch == '+' || ch == '-' || ch == '*' || ch == '/' 
	|| ch == ',' || ch == ';' || ch == '>' || ch == '<' || ch == '=' 
	|| ch == '(' || ch == ')' || ch == '[' || ch == ']' || ch == '{' 
	|| ch == '}' || ch == '\n' || ch == '\t');
}


int isOperator

extern int yylex();
int yywrap()
{
return (1);
}
void main()
{
while(yylex());
}  



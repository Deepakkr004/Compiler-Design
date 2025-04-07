extern int yywrap();
int yywrap()
{
	return (1);
}

main(){
while(yylex());
}

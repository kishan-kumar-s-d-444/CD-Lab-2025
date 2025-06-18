%{
	#include "y.tab.h"
	extern YYSTYPE yylval;  //Lexer(Flex)→Parser(Yacc) Communication: When the lexer matches a token (e.g., a number), it assigns the token’s value (e.g., 42) to yylval
%} 

%%
[0-9]+	{yylval=atoi(yytext);return NUM;}
[-+*/]	{return yytext[0];}
.	{return yytext[0];}
\n 	{return 0;}
%%

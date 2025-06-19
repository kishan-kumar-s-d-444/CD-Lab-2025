%{
	#include "y.tab.h"
	extern YYSTYPE yylval;  //e
%} 

%%
[0-9]+	{yylval=atoi(yytext);return NUM;}      //e
[-+*/]	{return yytext[0];}
\n 	{return 0;}
.	{return yytext[0];}
%%

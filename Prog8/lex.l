%{
#include "y.tab.h"
#include<string.h>
%}

%%
[0-9]+ {
yylval.exp=strdup(yytext);
return NUM;
}

[a-zA-Z][a-zA-Z0-9_]* {
 yylval.exp=strdup(yytext);
return IDEN;
}

[\-\+\*\/] return yytext[0];
[()=] return yytext[0];
[\n]+ {return '\n';}
[ \t]+ ;
. ;
%%

int yywrap(){
 return 1;
 }
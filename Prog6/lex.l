%{
#include "y.tab.h"
#include<stdlib.h>      //e
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

[\-\+\*\/] return yytext[0];    //e
[()=] return yytext[0];           //e
[\n]+ {return '\n';}       //e
[ \t]+ ;                //e
. ;
%%

int yywrap(){           //e
 return 1;
 }
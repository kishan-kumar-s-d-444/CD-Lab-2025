%{
#include "y.tab.h"
%}

%%
"int"|"float"|"char"|"void" {return TYPE;}
[0-9]+ {return NUM;}
[a-zA-Z_][a-zA-Z0-9_]* {return IDEN;}
"[" {return LB;}
"]" {return RB;}
"," {return COM;}
";" {return SEMI;}
"=" {return EQ;}
[ \n\t] ;
# {return 0;}
. {return yytext[0];}
%%

int yywrap()
{ return 1;
}
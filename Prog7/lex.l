%{
#include "y.tab.h"
%}

%%
"int"|"float"|"char"|"void" {return TYPE;}
[\+\-\*\/\=] {return OP;}
[a-zA-Z][a-zA-Z0-9_]* {return IDEN;}
[0-9]+ {return NUM;}
[ \n\t] ;
# {return 0;}
. {return yytext[0];}
%%
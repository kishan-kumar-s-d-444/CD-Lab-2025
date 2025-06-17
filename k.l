%{
    #include "y.tab.h"
%}

%%
"for" return FOR;
[0-9]+ return NUM;
[a-zA-Z]* return IDEN;
"<"|">"|"<="|">="|"=="|"!=" return OP;
[\n\t ] ;
. return yytext[0];
%%
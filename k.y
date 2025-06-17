%{
    #include<stdio.h>
    #include<stdlib.h>
    int for=0,cur=0,maxi=0;
    int yylex();
    int yyerror(const char *s);    
%}

%token NUM OP IDEN FOR

%%
S:P
  |SP
  ;
P:F
  |IDEN '='EXPR ';'
  |I';'
  |'{'S'}'
  |';' 
  ;

F:FOR'('ASSGN;COND;ASSGN')'{
    for++;
    cur++;
    if(cur>maxi) maxi=cur;
}
  P{
    cur--;
  }
  ;

ASSGN:IDEN OP IDEN
    |IDEN OP NUM
    |IDEN
    |
    ;

EXPR:IDEN
    |IDEN '+' IDEN
    |IDEN '-' IDEN
    |IDEN '*' IDEN
    |IDEN '/' IDEN
    ;

COND:IDEN '=' EXPR
    |IDEN
    ;
%%
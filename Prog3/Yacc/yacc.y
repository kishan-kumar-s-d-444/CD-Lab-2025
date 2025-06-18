%{
#include <stdio.h>
#include <stdlib.h>
int cnt = 0;
int yylex();
void yyerror(const char *s);
%}

%token FOR IDEN NUM

%%
S: S F {printf("Matched for loop\n");}
 |
 ; 

F: FOR COND BODY {cnt++;}
 ;

COND: '(' E ';' E ';' E ')' 
    ;

E: IDEN '=' E
 | IDEN OP IDEN
 | IDEN OP NUM
 | IDEN FIX
 | IDEN
 | '(' E ')'
 ;

OP: '=' '=' | '>' | '<' | '<' '=' | '>' '=' | '+' '=' | '-' '+' | '=' | '+' | '-' | '*'  

  ;



FIX: '+''+' | '-''-'
   ;


BODY: '{' BODY '}' 
    | F 
    | E ';' 
    |
    ;
%%



int main() {
    printf("Enter the snippet:\n");
    yyparse();
    printf("Count of for : %d\n", cnt);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Invalid: %s\n", s);
    exit(1);
}
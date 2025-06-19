// YACC program that identifies the Function Definition of C language

%{
#include<stdio.h>
#include<stdlib.h>
int cnt=0;
int stmt=0;
int param=0;
int yylex();
int yyerror(const char *s);
%}

%token TYPE IDEN NUM OP

%%
S : TYPE IDEN '(' PARAM ')' BODY{cnt++;printf("Function Declared\n");}
  ;

PARAM : p   {param++;}
      | p ',' PARAM {param++;}
      ; 

p : TYPE IDEN
  | NUM
  | IDEN
  ;

BODY : stmt ';'      {stmt++;}
     | '{'stmt ';' BODY'}' {stmt++;}
     |
     ;

stmt : TYPE IDEN
     | EXPR
     ;

EXPR : IDEN OP IDEN
     | NUM OP NUM
     | IDEN OP EXPR
     | IDEN OP NUM
     | NUM OP IDEN
     | IDEN
     ;
%%



int yyerror(const char *s){
 fprintf(stderr,"Error %s\n",s);
 exit(0);
}



int main(){ 
  printf("Enter the statement\n");
  yyparse();
  printf("Functions=%d\n",cnt);
  printf("Parameters=%d\n",param);
  printf("Statements=%d\n",stmt);
  return 0;-
}



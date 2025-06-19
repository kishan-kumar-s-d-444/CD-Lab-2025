%{
#include<stdio.h>
#include<stdlib.h>
int cnt=0;
int yylex();
int yyerror(const char *s);
%}

%token TYPE IDEN NUM LB RB SEMI COM EQ

%%
S : TYPE VAR SEMI {printf("DECLARED\n");}
  ;

VAR : v {cnt++;}
    | VAR COM v {cnt++;}
    ;

v : IDEN
| IDEN EQ NUM
| IDEN LB NUM RB
;
%%

int yyerror(const char *s){
 fprintf(stderr,"Error %s\n",s);
 exit(0);
}

int main(){ 
  printf("Enter the statement\n");
  yyparse();
  printf("Varidables=%d\n",cnt);
  return 0;
}
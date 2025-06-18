%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
%}

%%
S : A B | ;
A : 'a' A 'b' | ;
B : 'b' B 'c' | ;
%%

int yyerror()
{ printf("Invalid\n");
  exit(0);
  }

 int main()
 {
   printf("Enter the input\n");
   yyparse();
   printf("Success");
   return 0;
   }
%{
#include<stdio.h>
#include<stdlib.h>
int a=0,b=0,c=0,d=0;
%}

%%
\+?[0-9]+ {a++;}
\-[0-9]+ {b++;}
\+?[0-9]+\/\+?[0-9]+ {c++;} 
\-[0-9]+\/\-[0-9]+ {c++;} 
\+?[0-9]+\/\-[0-9]+ {d++;}
\-[0-9]+\/\+?[0-9]+ {d++;}
[ \t]+ ;
. {printf("Invalid\n");return yytext[0];}
[\n] {return 0;}
%%

int main()
{ 
  printf("Enter the number\n");
  yylex();
  printf("%d\n",a);
  printf("%d\n",b);
  printf("%d\n",c);
  printf("%d\n",d);
  printf("DOne\n");
  return 0;
  }

int yywrap()
{
 printf("INVALID\n"); 
 return 1;
}
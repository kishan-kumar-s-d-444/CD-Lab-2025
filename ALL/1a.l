%{
#include<stdio.h>
int words=0,lines=0,chars=0,spaces=0;
%}

%%
[\t] {spaces+=4;}
[ ] {spaces+=1;}
[\n] {lines++;}
[^ \t\n]+ {words++;chars+=yyleng;}
[$] {return 0;}
%%

int yywrap()
{
return 0;
}

int main()
{
 printf("Enter the input\n");
 yylex();
 printf("Words=%d\n",words);
 printf("lines=%d\n",lines);
 printf("chars=%d\n",chars);
 printf("spaces=%d\n",spaces);
 return 0;
 }
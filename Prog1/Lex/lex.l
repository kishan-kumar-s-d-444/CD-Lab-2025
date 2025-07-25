// LEX program to count number of words, lines, characters and whitespaces in a given paragraph
%{
#include<stdio.h>
int lines=0,chars=0,words=0,spaces=0;
%}
%%
\n	{lines++;} 
\t	{spaces+=4;}
[ ]	{spaces++;}
[^ \t\n#]+ {words++;chars+=yyleng;}     //
# {return 0;}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter the string:\n");
	yylex();
	printf("Lines: %d\nWords: %d\nChars: %d\nSpaces: %d\n",lines,words,chars,spaces);
	return 0;
}
	

%{
	#include<stdio.h>
	int single=0,multi=0,mlines=0;     //mlines: Counts newlines within multi-line comments
    FILE *fp;
%}

%%
"//"[^\n]*	{single++;fprintf(fp,"%s\n",yytext);}   //e
"/*" ( [^*] | [*]+[^*/] | [*]*)* "*/"	{           //e
	multi++;
	for(int i=0;i<yyleng;i++)
	{
		if(yytext[i]=='\n')
			mlines++;
	}
    fprintf(fp,"%s\n",yytext);
}
. {fprintf(yyout,"%s",yytext);}
%%

int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("input.txt","r");
	yyout=fopen("output.txt","w");
    fp=fopen("comments.txt","w");
	yylex();                                                               //e
	printf("Single: %d\n Multi: %d\nMlines: %d\n",single,multi,mlines);
	return 0;
}
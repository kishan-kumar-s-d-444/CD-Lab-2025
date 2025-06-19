%{
	#include<stdio.h>
	#include<stdlib.h>		
	int yylex();
	int yyerror();
%}

%token NUM
%left '+' '-'         //e
%left '/' '*'        //e

%%
S:I {printf("Result is %d\n",$$);}                                  //$$ = Value of the left-hand side (A)
;																	//$1 = Value of B (1st element)
I:I'+'I 	    {$$=$1+$3;}												//$2 = Value of C (2nd element)		
 |I'-'I 		{$$=$1-$3;}												//$3 = Value of D (3rd element)
 |I'*'I 		{$$=$1*$3;}
 |I'/'I 		{if($3==0){yyerror();}	else{$$=$1/$3;}}
 |'('I')'	    {$$=$2;}
 |NUM		    {$$=$1;}
 |'-'NUM		{$$=-$2;}                                           //e
;
%%

int main()
{
	printf("Enter operation:\n");
	yyparse();
	printf("Valid\n");
	return 0;
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}
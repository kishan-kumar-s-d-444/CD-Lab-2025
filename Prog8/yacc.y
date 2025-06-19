%{

#include<stdio.h>

#include<stdlib.h>

int yylex();

int yyerror();

extern FILE *yyin;

typedef char *string;

struct{

  string op1,op2,res;

  char op;

}code[100];

int idx=-1;

string addto(string ,string ,char);

void targetcode();

%}



%union{

  char *exp;

}

%token <exp> IDEN NUM 

%type <exp> EXPR

%right '='

%left '+''-'

%left '*''/'



%%

S : S s

  |

  ;

s : EXPR '\n'

  ;

EXPR : EXPR '+' EXPR {$$=addto($1,$3,'+');}

     | EXPR '-' EXPR {$$=addto($1,$3,'-');}

     | EXPR '*' EXPR {$$=addto($1,$3,'*');}

     | EXPR '/' EXPR {$$=addto($1,$3,'/');}

     | IDEN '=' EXPR {$$=addto($1,$3,'=');}

     | '('EXPR')' {$$=$2;}

     | IDEN {$$=$1;}

     | NUM {$$=$1;}

     ;

%%



string addto(string op1,string op2,char op){

 if(op=='='){

   idx++;

   code[idx].res = op1;

   code[idx].op1 = op2;

   code[idx].op = op;

   return op1;

 }

 idx++;

 string res=malloc(3);

 sprintf(res,"@%c\n",idx+'A');

 code[idx].op1=op1;

 code[idx].op2=op2;

 code[idx].op=op;

 code[idx].res=res;

 return res;

 }

 

void targetCode() {

	for(int i = 0; i <= idx; i++) {

		string instr;

		switch(code[i].op) {

		case '+': instr = "ADD"; break;

		case '-': instr = "SUB"; break;

		case '*': instr = "MUL"; break;

		case '/': instr = "DIV"; break;

		}



		printf("LOAD\t R1, %s\n", code[i].op1);

		printf("LOAD\t R2, %s\n", code[i].op2);

		printf("%s\t R3, R1, R2\n", instr);

		printf("STORE\t %s, R3\n", code[i].res);

	}

}



int main()

{ yyin=fopen("input.txt","r");

 yyparse();

  printf("\nTarget code:\n");

  targetCode();

  return 0;

  }



int yyerror()

{ printf("Error");

  exit(0);

}




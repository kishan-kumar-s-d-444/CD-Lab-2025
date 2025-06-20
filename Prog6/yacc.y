%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror();
extern FILE *yyin;    //e
typedef char *string;

struct{
  string op1,op2,res;
  char op;
}code[100];
int idx=-1;

string addto(string ,string ,char);
void three();
void quad();
%}

%union{
  char *exp;
}

%token <exp> IDEN NUM 
%type <exp> EXPR       //e
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
 sprintf(res,"@%c\n",idx+'A');    //e
 code[idx].op1=op1;
 code[idx].op2=op2;
 code[idx].op=op;
 code[idx].res=res;
 return res;
 }

void three(){
 for(int i=0;i<=idx;i++){
  printf("%s-->%s %c %s:\n",code[i].res,code[i].op1,code[i].op,code[i].op2);
}
}

void quad(){
 for(int i=0;i<=idx;i++){
  printf("%d :: %s-->%s %s %c:\n",i,code[i].res,code[i].op1,code[i].op2,code[i].op);
}
}

int main()
{ yyin=fopen("6.txt","r");
  yyparse();
  printf("Three address\n");
  three();
  printf("Quad\n");
  quad();
  return 0;
  }
  
int yyerror()
{ printf("Error");
  exit(0);
}




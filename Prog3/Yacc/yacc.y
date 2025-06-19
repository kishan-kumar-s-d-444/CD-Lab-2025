%{

#include<stdio.h>

#include<stdlib.h>

int a=0,b=0,c=0;

void yyerror(const char *s);

int yylex();

%}



%token FOR IDEN NUM OP REL FIX



%%

S : S F {printf("Started\n");}

  |

  ;

F: FOR '(' E ';' COND ';' E ')' {

    printf("ENterd once\n");

    a++;

    b++;

    if(b>c) c=b;

    }

    BODY{

     b--;

     }

  ;

E : IDEN OP IDEN

  | IDEN OP NUM

  | IDEN OP E

  | IDEN FIX

  | FIX IDEN

  | IDEN

  | NUM

  |

  ;

COND : IDEN REL NUM

     | IDEN REL IDEN

     |

     ;

BODY : E ';'

     | F

     | '{'BODY'}'

     |

     ;

%%



int main()

{ 

  printf("Enter the code\n");

  yyparse();

  printf("No of loops%d\n",a);

  printf("Maximum nestings%d\n",c);

  return 0;

  }

  

void yyerror(const char *s) {

    fprintf(stderr, "Invalid: %s\n", s);

    exit(1);

}
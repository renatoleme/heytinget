%{

/*
 * Parser.y file
 * To generate the parser run: "bison Parser.y"
 */

#include "Expression.h"
#include "Parser.h"
#include "Lexer.h"

int yyerror(SExpression **expression, yyscan_t scanner, const char *msg) {
    /* Add error handling routine as needed */
}

%}

%code requires {
  typedef void* yyscan_t;
}

%output  "Parser.c"
%defines "Parser.h"

%define api.pure
%lex-param   { yyscan_t scanner }
%parse-param { SExpression **expression }
%parse-param { yyscan_t scanner }

%union {
    char value;
    SExpression *expression;
}

%token TOKEN_LPAREN   "("
%token TOKEN_RPAREN   ")"
%token TOKEN_PLUS     "\\/"
%token TOKEN_STAR     "/\\"
%token TOKEN_IMPLY     "->"
%token TOKEN_NOT     "~"
%token <value> TOKEN_PROPOSITION "proposition"

%type <expression> expr

/* Precedence (increasing) and associativity:
   a+b+c is (a+b)+c: left associativity
   a+b*c is a+(b*c): the precedence of "*" is higher than that of "+". */
%right "->"
%right "\\/"
%right "/\\"
%right "~"


%%

input
    : expr { *expression = $1; }
    ;

expr
    : expr[L] "\\/" expr[R] { $$ = createOperation( eADD, $L, $R ); }
    | expr[L] "/\\" expr[R] { $$ = createOperation( eMULTIPLY, $L, $R ); }
    | expr[L] "->" expr[R] { $$ = createOperation( eIMPLY, $L, $R ); }
    | "~" expr[R] { $$ = createUnaryOperation( eNOT, $R ); }
    | "(" expr[E] ")"     { $$ = $E; }
    | "proposition"            { $$ = createNumber($1); }
    ;

%%

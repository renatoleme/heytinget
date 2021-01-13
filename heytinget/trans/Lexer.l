%{

/*
 * Lexer.l file
 * To generate the lexical analyzer run: "flex Lexer.l"
 */

#include "Expression.h"
#include "Parser.h"

#include <stdio.h>

%}

%option outfile="Lexer.c" header-file="Lexer.h"
%option warn nodefault

%option reentrant noyywrap never-interactive nounistd
%option bison-bridge

%%

[ \r\n\t]*   { continue; /* Skip blanks. */ }
[a-z]+       { sscanf(yytext, "%c", &yylval->value); return TOKEN_PROPOSITION; }
[A-Z]+       { sscanf(yytext, "%c", &yylval->value); return TOKEN_PROPOSITION; }

"/\\"          { return TOKEN_STAR; }
"\\/"          { return TOKEN_PLUS; }
"("            { return TOKEN_LPAREN; }
")"            { return TOKEN_RPAREN; }
"->"          { return TOKEN_IMPLY; }
"~"           {return TOKEN_NOT; }

.            { continue; /* Ignore unexpected characters. */}

%%

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 0;
}

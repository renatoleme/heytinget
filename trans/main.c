/*
 * main.c file
 */

#include "Expression.h"
#include "Parser.h"
#include "Lexer.h"
#include "string.h"
#include <ctype.h>
#include <stdio.h>

int yyparse(SExpression **expression, yyscan_t scanner);

SExpression *getAST(const char *expr)
{
    SExpression *expression;
    yyscan_t scanner;
    YY_BUFFER_STATE state;

    if (yylex_init(&scanner)) {
        /* could not initialize */
        return NULL;
    }

    state = yy_scan_string(expr, scanner);

    if (yyparse(&expression, scanner)) {
        /* error parsing */
        return NULL;
    }

    yy_delete_buffer(state, scanner);

    yylex_destroy(scanner);

    return expression;
}


char * toStr(char c) {
  static char str[10];
  sprintf(str, " %c ", c);
  //printf ("%s \n", str);
  return str;
}

char empty[] = "";

char * convert(SExpression *e, char * buffer)
{

    char str_left[10000];
    char str_right[10000];

    switch (e->type) {
        case eVALUE:
            return toStr(e->value);
        case eMULTIPLY:
            strcpy(str_left, convert(e->left, buffer));
            strcpy(str_right, convert(e->right, buffer));
            sprintf (buffer, "~(%s -> ~ %s)", str_left, str_right);
            return buffer;
        case eADD:
            strcpy(str_left, convert(e->left, buffer));
            strcpy(str_right, convert(e->right, buffer));
            sprintf (buffer, "(~ %s -> %s) ", str_right, str_left);
            return buffer;
        case eIMPLY:
            strcpy(str_left, convert(e->left, buffer));
            strcpy(str_right, convert(e->right, buffer));
            sprintf (buffer, "(%s -> %s)", str_left, str_right);
            return buffer;
        case eNOT:
            strcpy(str_right, convert(e->right, buffer));
            sprintf (buffer, "~ %s", str_right);
            return buffer;
        default:
            return empty;
    }
}

void remove_spaces(char* s) {
    const char* d = s;
    do {
        while (*d == ' ') {
            ++d;
        }
    } while (*s++ = *d++);
}

char p_token[800];
char c = 'a';
int i = 1;

char * trans(SExpression *e, char * buffer)
{

    char str_left[10000];
    char str_right[10000];

    switch (e->type) {
        case eVALUE:
        	strcpy(p_token, "o[");	
        	i = tolower(e->value) - 112; // importante: variaveis proposicionais devem começar em p
        	c = i+'0';
			strcat(p_token, toStr(c));
			strcat(p_token, "]");
			remove_spaces(p_token);
            return p_token;
        case eMULTIPLY:
            strcpy(str_left, trans(e->left, buffer));
            strcpy(str_right, trans(e->right, buffer));
            sprintf (buffer, "Int ( %s ).intersection ( Int ( %s ) )", str_left, str_right);
            return buffer;
        case eADD:
            strcpy(str_left, trans(e->left, buffer));
            strcpy(str_right, trans(e->right, buffer));
            sprintf (buffer, "Int ( %s ).union ( Int ( %s ) )", str_left, str_right);
            return buffer;
        case eIMPLY:
            strcpy(str_left, trans(e->left, buffer));
            strcpy(str_right, trans(e->right, buffer));
            sprintf (buffer, "Int ( complement ( %s ).union ( Int ( %s )) )", str_left, str_right);
            return buffer;
        case eNOT:
            strcpy(str_right, trans(e->right, buffer));
            sprintf (buffer, "Int ( complement ( %s ) )", str_right);
            return buffer;
        default:
            return empty;
    }
}

void writeOutput(char * out) {
  FILE *fp = fopen ("t_out", "w");

  fwrite (out, sizeof(char), strlen(out), fp);
  fclose(fp);

  return;
}

int main(int argc, char *argv[])
{
    if (argc <= 1)
      printf ("\nMissing proposition.\n\n");
    else {
      system ("clear");
      // "( ((P \\/ Q) \\/ (Z /\\ R) /\\ (P \\/ Q) \\/ (Z /\\ R)) /\\ ((P \\/ Q) \\/ (Z /\\ R) /\\ (P \\/ Q) \\/ (Z /\\ R)) )"
      char proposition[100000];
      strcpy(proposition, argv[1]);
      SExpression *e = getAST(proposition);
      char result[100000], output[100000];
      trans(e, result);

      //printf("\n******************************\n| Welcome to trans v. 0.1!   |");
      //printf("\n******************************\n \nHere is your output:\n\n");
      //printf("Original: %s \n\n", proposition);
      //printf("Converted: %s \n\n", conv);
      //printf("Equivalence relation: %s <-> %s\n\n", proposition, conv);

     // printf("Translated: \n\n");
      //printf("%s \n\n", result);

      sprintf (output, "%s", result);
      writeOutput(output);

      // char command[100000];

      // sprintf (command, "./make_tex.sh \"%s\" \"%s\"", proposition, conv);
      // system (command);

      deleteExpression(e);
    }
    return 0;
}

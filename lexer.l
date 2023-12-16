%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
void yyerror(char *);
/* Definiciones de las constantes de manifiesto LT, LE, EQ, NE, GT, GE, IF, THEN, ELSE, ID, NUMERO, OPREL */
%}

/* Definiciones regulares */

delim [ \t\n]
ws {delim}+
letra [A-Za-z]
digito [0-9]
numero {digito}+
tipo (int|char|bool|float)
id ({letra}|_)({letra}|{digito}|_)*
real {digito}+(\.{digito}+)?(E[+\-]?{digito}+)?

%%
{ws} {/*Ignorar*/} // Ignorar espacios en blanco
{tipo} {printf("TIPO: %s\n",yytext); yylval.str = strdup(yytext); return BASIC;}
"if" { printf("IF\n"); return IF;}
"else" { printf("ELSE\n"); return ELSE;}
"while" { printf("WHILE\n"); return WHILE;}
"do" { printf("DO\n"); return DO;}
"break" { printf("BREAK\n"); return BREAK;}
"true" { printf("TRUE\n"); yylval.str = strdup(yytext); return TRUE;}
"false" { printf("FALSE\n"); yylval.str = strdup(yytext); return FALSE;}
{id} {printf("ID: %s\n",yytext); yylval.str = strdup(yytext); return ID;}
{numero} { printf("NUMERO: %s\n",yytext); yylval.num = atoi(yytext); return NUM;}
{real} {printf("Real: %s\n",yytext); yylval.real = atof(yytext); return REAL;}
"+" { printf("SUMA\n"); return PLUS;}
"-" { printf("RESTA\n"); return MINUS;}
"*" { printf("MULTIPLICACION\n"); return TIMES;}
"/" { printf("DIVISION\n"); return DIVIDE;}
"{" { printf("L_LLAVE\n"); return LBRACE;}
"}" { printf("R_LLAVE\n"); return RBRACE;}
"[" { printf("L_CORCHETE\n"); return LBRACKET;}
"]" { printf("R_CORCHETE\n"); return RBRACKET;}
"(" { printf("PARENTESIS_IZQ\n"); return LPAREN;}
")" { printf("PARENTESIS_DER\n"); return RPAREN;}
";" { printf("PUNTO_Y_COMA\n"); return SEMICOLON;}
"=" { printf("ASIGNACION: =\n"); return ASSIGN;}
"&&" { printf("COMP: AND\n"); return AND;}
"||" { printf("COMP: OR\n"); return OR;}
"!" { printf("COMP: NOT\n"); return NOT;}
"<" { printf("OPREL: <\n"); return LT;}
"<=" { printf("OPREL: <=\n"); return LE;}
">" { printf("OPREL: >\n"); return GT;}
">=" { printf("OPREL: >=\n"); return GE;}
"==" { printf("OPREL: ==\n"); return EQ;}
"!=" { printf("OPREL: !=\n"); return NE;}
. { fprintf(stderr, "Error: Caracter no reconocido: %s\n", yytext); return UNKNOWN; }
%%

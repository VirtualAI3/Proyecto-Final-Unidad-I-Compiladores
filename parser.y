%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern FILE *yyin; 
int yylex(void);
void yyerror(char *);
%}

%union {
    int num;
    double real;
    char *str;
}

%token <num> NUM
%token <real> REAL
%token <str> ID BASIC
%token IF ELSE WHILE DO BREAK TRUE FALSE EQ NE LT LE GT GE AND OR NOT ASSIGN SEMICOLON LBRACKET RBRACKET LBRACE RBRACE LPAREN RPAREN PLUS MINUS TIMES DIVIDE UNKNOWN 

%start PROGRAMA
%%
PROGRAMA
    : BLOQUE { printf("\nPrograma reconocido correctamente\n"); return 0; }
    ;

BLOQUE
    : LBRACE DECLS INSTRS RBRACE
    {
        // Realizar acciones al reconocer el bloque
    }
    ;

DECLS
    : DECLS DECL
    | /*ε*/
    {
        // Realizar acciones al reconocer las declaraciones
    }
    ;

DECL
    : TYPE ID SEMICOLON
    {
        // Realizar acciones al reconocer una declaración
    }
    ;
TYPE
    : TYPE LBRACKET NUM RBRACKET
    | BASIC {

    }
;
INSTRS
    : INSTRS INSTR
    | /*ε*/
    {
        // Realizar acciones al reconocer las instrucciones
    }
    ;

INSTR
    : LOC ASSIGN BOOL SEMICOLON
    | IF LPAREN BOOL RPAREN INSTR
    | IF LPAREN BOOL RPAREN INSTR ELSE INSTR
    | WHILE LPAREN BOOL RPAREN INSTR
    | DO INSTR WHILE LPAREN BOOL RPAREN SEMICOLON
    | BREAK SEMICOLON
    | BLOQUE
    {
        // Realizar acciones al reconocer una instrucción
    }
    ;

LOC
    : LOC LBRACKET BOOL RBRACKET
    | ID
    {
        // Realizar acciones al reconocer una ubicación
    }
    ;

BOOL
    : BOOL OR COMB
    | COMB
    {
        // Realizar acciones al reconocer una expresión booleana
    }
    ;

COMB
    : COMB AND IGUALDAD
    | IGUALDAD
    {
        // Realizar acciones al reconocer una combinación booleana
    }
    ;

IGUALDAD
    : IGUALDAD EQ REL
    | IGUALDAD NE REL
    | REL
    {
        // Realizar acciones al reconocer una comparación de igualdad
    }
    ;

REL
    : EXPR LT EXPR
    | EXPR LE EXPR
    | EXPR GE EXPR
    | EXPR GT EXPR
    | EXPR
    {
        // Realizar acciones al reconocer una relación
    }
    ;

EXPR
    : EXPR PLUS TERM
    | EXPR MINUS TERM
    | TERM
    {
        // Realizar acciones al reconocer una expresión
    }
    ;

TERM
    : TERM TIMES UNARIO
    | TERM DIVIDE UNARIO
    | UNARIO
    {
        // Realizar acciones al reconocer un término
    }
    ;

UNARIO
    : NOT UNARIO
    | MINUS UNARIO
    | FACTOR
    {
        // Realizar acciones al reconocer un operador unario
    }
    ;

FACTOR
    : LPAREN BOOL RPAREN
    | LOC
    | NUM
    | REAL
    | TRUE
    | FALSE
    {
        // Realizar acciones al reconocer un factor
    }
    ;

%%
int main (){
    yyin = fopen("entrada.txt", "r");
    if (!yyin) {
        fprintf(stderr, "No se pudo abrir el archivo de entrada\n");
        return 1;
    }
    yyparse();
    fclose(yyin);
    return 0;
}
void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int yywrap() {
    return 1;
}
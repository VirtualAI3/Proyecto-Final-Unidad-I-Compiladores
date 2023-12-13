%option noyywrap
%{
 /* definiciones de las constantes de manifiesto
 LT, LE, EQ, NE, GT, GE,
 IF, THEN, ELSE, ID, NUMERO, OPREL */
%}

/* definiciones regulares */

delim [ \t\n]
ws {delim}+
letra [A-Za-z]
digito [0-9]
numero {digito}+
tipo (int|char|bool|float)
id ({letra}|_)({letra}|{digito}|_)*
real {digito}+(\.{digito}+)?(E[+−]?{digito}+)?
%%
{ws} {/*Ignorar*/} // Ignorar espacios en blanco
{tipo} {printf("TIPO: %s\n",yytext);}
"if" { printf("IF\n"); }
"else" { printf("ELSE\n"); }
"while" { printf("WHILE\n"); }
"do" { printf("DO\n"); }
"break" { printf("BREAK\n"); }
"true" { printf("TRUE\n"); }
"false" { printf("FALSE\n"); }
{id} {printf("ID: %s\n",yytext);}
{numero} { printf("NUMERO: %s\n",yytext); }
{real} {printf("Real: %s\n",yytext);}
"+" { printf("SUMA\n"); }
"-" { printf("RESTA\n"); }
"*" { printf("MULTIPLICACION\n"); }
"/" { printf("DIVISION\n"); }
"{" { printf("L_LLAVE\n"); }
"}" { printf("R_LLAVE\n"); }
"[" { printf("L_CORCHETE\n"); }
"]" { printf("R_CORCHETE\n"); }
"(" { printf("PARENTESIS_IZQ\n"); }
")" { printf("PARENTESIS_DER\n"); }
";" { printf("PUNTO_Y_COMA\n"); }
"=" { printf("ASIGNACION: =\n"); }
"&&" { printf("COMP: AND\n"); }
"||" { printf("COMP: OR\n"); }
"!" { printf("COMP: NOT\n"); }
"<" { printf("OPREL: <\n"); }
"<=" { printf("OPREL: <=\n"); }
">" { printf("OPREL: >\n"); }
">=" { printf("OPREL: >=\n"); }
"==" { printf("OPREL: ==\n"); }
"!=" { printf("OPREL: !=\n"); }
. { /* Manejar caracteres no reconocidos */ }
%%
int main()
{
    yyin = fopen("entrada.txt", "r");
    yylex();
    fclose(yyin);
    return 0;
}
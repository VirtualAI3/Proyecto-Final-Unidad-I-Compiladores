
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUM = 258,
     REAL = 259,
     ID = 260,
     BASIC = 261,
     IF = 262,
     ELSE = 263,
     WHILE = 264,
     DO = 265,
     BREAK = 266,
     TRUE = 267,
     FALSE = 268,
     EQ = 269,
     NE = 270,
     LT = 271,
     LE = 272,
     GT = 273,
     GE = 274,
     AND = 275,
     OR = 276,
     NOT = 277,
     ASSIGN = 278,
     SEMICOLON = 279,
     LBRACKET = 280,
     RBRACKET = 281,
     LBRACE = 282,
     RBRACE = 283,
     LPAREN = 284,
     RPAREN = 285,
     PLUS = 286,
     MINUS = 287,
     TIMES = 288,
     DIVIDE = 289,
     UNKNOWN = 290
   };
#endif
/* Tokens.  */
#define NUM 258
#define REAL 259
#define ID 260
#define BASIC 261
#define IF 262
#define ELSE 263
#define WHILE 264
#define DO 265
#define BREAK 266
#define TRUE 267
#define FALSE 268
#define EQ 269
#define NE 270
#define LT 271
#define LE 272
#define GT 273
#define GE 274
#define AND 275
#define OR 276
#define NOT 277
#define ASSIGN 278
#define SEMICOLON 279
#define LBRACKET 280
#define RBRACKET 281
#define LBRACE 282
#define RBRACE 283
#define LPAREN 284
#define RPAREN 285
#define PLUS 286
#define MINUS 287
#define TIMES 288
#define DIVIDE 289
#define UNKNOWN 290




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 10 "parser.y"

    int num;
    double real;
    char *str;



/* Line 1676 of yacc.c  */
#line 130 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;



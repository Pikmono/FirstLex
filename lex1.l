%option noyywrap

%{
#include <stdio.h>
%}

ALFA [a-z]
BINA [0/1]
ALFAM [A-Z]

NUM_INT [0-9]+
NUM_DEC [0-9]+"."[0-9]+

%%
.*ae.* { printf("TOKEN_AE: %s\n", yytext); }
{ALFA}*ai{ALFA}* { printf("TOKEN_AI: %s\n", yytext); }
{ALFA}*ao{ALFA}* { printf("TOKEN_AO: %s\n", yytext); }
{ALFA}*au{ALFA}* { printf("TOKEN_AU: %s\n", yytext); }

0{BINA}*0 { printf("TOKEN_0_BINA_0: %s\n", yytext); }

{ALFAM}{ALFA}* { printf("TOKEN_NOMBRE: %s\n", yytext); }

{NUM_INT} { printf("TOKEN_UNSIGNED_INT: %s\n", yytext);}
{NUM_DEC} { printf("TOKEN_UNSIGNED_FLOAT: %s\n", yytext);}

while { printf("TOKEN_BUCLE: %s\n", yytext); }
if { printf("TOKEN_CONDICIONAL: %s\n", yytext); }
int { printf("TOKEN_INT: %s\n", yytext); }
class { printf("TOKEN_CLASS: %s\n", yytext); }
void { printf("TOKEN_VOID: %s\n", yytext); }

.|\n
%%

int main() {

	yylex();

	return 0;
}

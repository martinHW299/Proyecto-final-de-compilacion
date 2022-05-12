/* Sección de declaraciones de JFlex */
%%
%public
%class AnalizadorLexico
%{
 
 /* Código personalizado */
 
 // Se agregó una propiedad para verificar si existen tokens pendientes
 private boolean _existenTokens = false;
 
 public boolean existenTokens(){
 return this._existenTokens;
 }
 
%}
 
 /* Al utilizar esta instrucción, se le indica a JFlex que devuelva objetos del tipo TokenPersonalizado */
%type TokenPersonalizado
 
%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}
 
%eof{
 
 /* Código a ejecutar al finalizar el análisis, en este caso cambiaremos el valor de una variable bandera */
 this._existenTokens = false;
 
%eof}
 
/* Inicio de Expresiones regulares */
 
 Digito = [0-9]
 Numero = {Digito} {Digito}* {Decimal}?
 Variable = [a-z]
 Igualdad = "="
 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n
 Suma = "suma"
 Resta = "resta"
 Dividir = "dividir"
 Mult = "multiplicar"
 Decimal = "."{Digito}*
 
/* Finaliza expresiones regulares */
 
%%
/* Finaliza la sección de declaraciones de JFlex */
 
/* Inicia sección de reglas */
 
// Cada regla está formada por una {expresión} espacio {código}
 
{Numero} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "NUMERO");
 this._existenTokens = true;
 return t;
}

{Variable} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "VARIABLE");
 this._existenTokens = true;
 return t;
}
 
{Suma} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "SUMA");
 this._existenTokens = true;
 return t;
}
{Resta} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "RESTA");
 this._existenTokens = true;
 return t;
}
{Dividir} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "DIVIDIR");
 this._existenTokens = true;
 return t;
}
{Mult} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "MULTIPLICAR");
 this._existenTokens = true;
 return t;
}
 
{Igualdad} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "IGUALDAD");
 this._existenTokens = true;
 return t;
}
 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}
 
{SaltoDeLinea} {
 TokenPersonalizado t = new TokenPersonalizado("Enter", "NUEVA_LINEA");
 this._existenTokens = true;
 return t;
}
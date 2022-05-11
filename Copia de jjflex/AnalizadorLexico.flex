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
Suma = {Letra}{Espacio}{Simbolo}{Espacio}"suma"{Espacio}{Numero}{Espacio}{Numero}
Resta = {Letra}{Espacio}{Simbolo}{Espacio}"resta"{Espacio}{Numero}{Espacio}{Numero}
Multiplicar = {Letra}{Espacio}{Simbolo}{Espacio}"multiplicar"{Espacio}{Numero}{Espacio}{Numero}
Dividir = {Letra}{Espacio}{Simbolo}{Espacio}"dividir"{Espacio}{Numero}{Espacio}{Numero}
Digito = [0-9]
Numero = {Digito} {Digito}* {Decimal}?
Letra = [A-Za-z]
Simbolo = "*"|"+"|"-"|"/"|"#"|"="
Espacio = " "
SaltoDeLinea = \n|\r|\r\n
Palabra = {Letra} {Letra}*
Decimal = "."{Digito}*
/* Finaliza expresiones regulares */
%%
/* Finaliza la sección de declaraciones de JFlex */
/* Inicia sección de reglas */
 
// Cada regla está formada por una {expresión} espacio {código}
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

{Multiplicar} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "MULTIPLICAR");
 this._existenTokens = true;
 return t;
}

{Dividir} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "DIVIDIR");
 this._existenTokens = true;
 return t;
}

{Numero} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "NUMERO");
 this._existenTokens = true;
 return t;
}
 
{Palabra} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "PALABRA");
 this._existenTokens = true;
 return t;
}
 
{Simbolo} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "SIMBOLO");
 this._existenTokens = true;
 return t;
}

{SaltoDeLinea} {
 TokenPersonalizado t = new TokenPersonalizado("Enter", "NUEVA_LINEA");
 this._existenTokens = true;
 return t;
}


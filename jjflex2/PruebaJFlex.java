import java.io.BufferedReader;
import java.io.FileReader;
 
public class PruebaJFlex {
    public static void main(String[] args) {
        try {
            // Asignación del nombre de archivo por defecto que usará la aplicación
            String archivo = "prueba.txt";
            // Se trata de leer el archivo y analizarlo en la clase que se ha creado con JFlex
            BufferedReader buffer = new BufferedReader(new FileReader(archivo));
            AnalizadorLexico analizadorLexico = new AnalizadorLexico(buffer);
            while(true){

                // Obtener el token analizado y mostrar su información
                TokenPersonalizado token = analizadorLexico.yylex();

                if (!analizadorLexico.existenTokens())
                    break;

                System.out.println(token.toString());
            }
            System.out.println("\n");
        }catch (Exception e){
            System.out.println(e);
        }

        try {
            // Asignación del nombre de archivo por defecto que usará la aplicación
            String archivo = "prueba.txt";
            // Se trata de leer el archivo y analizarlo en la clase que se ha creado con JFlex
            BufferedReader buffer = new BufferedReader(new FileReader(archivo));
            AnalizadorSintactico analizadorSintactico = new AnalizadorSintactico(buffer);
            PruebaJFlex pruebaJFlex = new PruebaJFlex();
            while (true) {
                // Obtener el token analizado y mostrar su información
                TokenPersonalizado token = analizadorSintactico.yylex();

                System.out.println(token);

                if (token.getToken().equals("SUMA")) {
                    String[] arr = token.getLexema().split(" ");
                    double a = Double.parseDouble(arr[3]);
                    double b = Double.parseDouble(arr[4]);
                    System.out.println("Resultado:" + pruebaJFlex.suma(a, b));
                }

                if (token.getToken().equals("RESTA")) {
                    String[] arr = token.getLexema().split(" ");
                    double a = Double.parseDouble(arr[3]);
                    double b = Double.parseDouble(arr[4]);
                    System.out.println("Resultado:" + pruebaJFlex.resta(a, b));
                }

                if (token.getToken().equals("MULTIPLICAR")) {
                    String[] arr = token.getLexema().split(" ");
                    double a = Double.parseDouble(arr[3]);
                    double b = Double.parseDouble(arr[4]);
                    System.out.println("Resultado:" + pruebaJFlex.multiplicar(a, b));
                }

                if (token.getToken().equals("DIVIDIR")) {
                    String[] arr = token.getLexema().split(" ");
                    double a = Double.parseDouble(arr[3]);
                    double b = Double.parseDouble(arr[4]);
                    System.out.println("Resultado:" + pruebaJFlex.dividir(a, b));
                }
/*
Semantico semantico = new Semantico();
                semantico.operacion(token.getLexema());

 */
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        try {
            // Asignación del nombre de archivo por defecto que usará la aplicación
            String archivo = "prueba.txt";
            // Se trata de leer el archivo y analizarlo en la clase que se ha creado con JFlex
            BufferedReader buffer = new BufferedReader(new FileReader(archivo));
            AnalizadorSintactico analizadorSintactico = new AnalizadorSintactico(buffer);
            while (true) {
                // Obtener el token analizado y mostrar su información
                TokenPersonalizado token = analizadorSintactico.yylex();
                Semantico semantico = new Semantico();
                semantico.operacion(token.getLexema());
            }
        }catch (Exception e){

        }
    }

    public double suma(double a , double b){
        return a + b;
    }
    public double resta(double a, double b) { return a - b; }
    public double multiplicar(double a, double b) { return a * b; }
    public double dividir(double a, double b) { return a / b; }

}
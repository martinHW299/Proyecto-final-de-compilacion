import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Semantico {
    String regex1 = "[a-z]";
    String regex2 = "=";
    String regex3 = "suma";
    String regex4 = "resta";
    String regex5 = "dividir";
    String regex6 = "multiplicar";
    String regex7 = "\\d{1,20}";

    Pattern pat1 = Pattern.compile(regex1);
    Pattern pat2 = Pattern.compile(regex2);
    Pattern pat3 = Pattern.compile(regex3);
    Pattern pat4 = Pattern.compile(regex4);
    Pattern pat5= Pattern.compile(regex5);
    Pattern pat6 = Pattern.compile(regex6);
    Pattern pat7 = Pattern.compile(regex7);

    public void operacion(String cadena){
        String [] arr = cadena.split(" ");
        for (int i = 0; i < arr.length ; i++) {
            Matcher mat1 = pat1.matcher(arr[i]);
            Matcher mat2 = pat2.matcher(arr[i]);
            Matcher mat3 = pat3.matcher(arr[i]);
            Matcher mat4 = pat4.matcher(arr[i]);
            Matcher mat5 = pat5.matcher(arr[i]);
            Matcher mat6 = pat6.matcher(arr[i]);
            Matcher mat7 = pat7.matcher(arr[i]);
            if (mat1.matches()){
                System.out.println("<Identificador>");
            }else if (mat2.matches()){
                System.out.println("<Simbolo igual>");
            }else if (mat3.matches()){
                System.out.println("<Operacion binaria suma>");
            }else if (mat4.matches()){
                System.out.println("<Operacion binaria resta>");
            }else if (mat5.matches()){
                System.out.println("<Operacion binaria division>");
            }else if (mat6.matches()){
                System.out.println("<Operacion binaria multiplicacion>");
            }else if (mat7.matches()){
                System.out.println("<Digito>");
            }
            if(i==4)
            System.out.println("\n");
        }
    }
}

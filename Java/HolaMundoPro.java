import java.util.Scanner;
import java.util.Date;

public class HolaMundoPro {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        
        System.out.println("Ingresa tu nombre:");
        String nombre = s.nextLine();
        
        System.out.println("Escribe un mensaje:");
        String mensaje = s.nextLine();

        System.out.println("Este es tu mensaje personalizado:");

        Date fecha = new Date();

        System.out.println(mensaje + "\n" + nombre + " - " + fecha);

        s.close();
        
    }
    
}

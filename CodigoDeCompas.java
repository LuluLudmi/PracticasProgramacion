/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package codigodecompas;

import java.util.Scanner;

/**
 *
 * @author alumno
 */
public class CodigoDeCompas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner teclado = new Scanner(System.in);
           int token = 384800;
        String usuario = "Pepito";
        String contrase�a = "ContraCorrecta";
        int tokenIngresado;
        int intentos = 3;
        System.out.println("Bienvenido a Online Banking!.  "
                + "Recuerde que su claven Token actual es: " + token);

        do {

            do {
                System.out.println("Por favor ingrese su usuario para continuar: ");
                usuario = teclado.nextLine();
                if (usuario.equalsIgnoreCase("Pepito")) {
                    System.out.println("Usuario correcto");
                } else {
                    intentos--;
                    System.out.println("Usuario incorrecto. Usted tiene " + intentos + " intentos restantes.");
                }
                if (intentos == 0) {
                    System.out.println("Debe dirigirse a la sucursal de banco m�s cercana "
                            + "para poder desbloquearsus credenciales.");
                    System.exit(0);
                }
            } while (!usuario.equalsIgnoreCase("Pepito"));   //1er control

            do {
                System.out.println("Ingrese su contrase�a");
                contrase�a = teclado.nextLine();
                if (contrase�a.equals("ContraCorrecta")) {
                    System.out.println("Contrase�a correcta.");
                } else {
                    intentos--;
                    System.out.println("Contrase�a incorrecta. Usted tiene " + intentos + " intentos restantes.");
                }
                if (intentos == 0) {
                    System.out.println("Debe dirigirse a la sucursal de banco m�s cercana "
                            + "para poder desbloquearsus credenciales.");
                    System.exit(0);
                }
            } while (!contrase�a.equals("ContraCorrecta"));  //2do control

            do {
                System.out.println("Ingrese el codigo Token");
                tokenIngresado = teclado.nextInt();
                if (token == tokenIngresado) {
                    System.out.println("Bienvenido a su cuenta Pepito");
                    System.exit(0);
                } else {
                    intentos--;
                    System.out.println("Token incorrecto. Usted tiene " + intentos + " intentos restantes.");
                }
                if (intentos == 0) {
                    System.out.println("Debe dirigirse a la sucursal de banco m�s cercana "
                            + "para poder desbloquear sus credenciales.");
                    System.exit(0);
                }
            } while (token != tokenIngresado);  //3er control

        } while (intentos > 0);
    }
    
}

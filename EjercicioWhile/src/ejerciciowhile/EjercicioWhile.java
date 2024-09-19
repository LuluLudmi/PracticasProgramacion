/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejerciciowhile;

import java.util.Scanner;

/**
 *
 * @author alumno
 */
public class EjercicioWhile {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        /*
        Crear una aplicación que valide el ingreso a una
        plataforma Online Banking a través de una clave Token.
        
        Se debe tener en cuenta lo siguiente:
        * La Clave Token debe ser un número aleatorio
        de 6 dígitos.
        * El cliente debe ingresar los campos Usuario,
        Contraseña y Clave Token (todos obligatorios).
        * El campo Usuario no distingue minúsculas
        o mayúsculas.
        * El campo Contraseña es sensible a las
        minúsculas y mayúsculas.
        La clave Token aleatoria se le informa al usuario al 
        pedirle que ingrese las credenciales.        
        * El cliente solo posee 3 intentos de logueo. 
	* Si alcanza los 3 intentos fallidos de forma
        consecutiva, la aplicación deberá informar al
        usuario que debe dirigirse a la sucursal del
        banco más cercana para poder desbloquear
        sus credenciales.
        * Por cada intento fallido, la aplicación debe
        preguntar al cliente si desea continuar
        colocando las credenciales de manera correcta.
        * Si el cliente coloca las credenciales de forma
        correcta, deberá informar que ha ingresado
        correctamente al Online Banking.
         */

        Scanner teclado = new Scanner(System.in);
        final String USUARIO_CORRECTO = "pepito";
        final String CLAVE_CORRECTA = "1234";
        final String TOKEN_CORRECTO = "456789";

        int intentos = 3;

        do {
            System.out.println("Bienvenido a su página de homebanking");
            System.out.println("Por favor ingrese su usuario: ");
            String usuario = teclado.nextLine();
            System.out.println("Por favor ingrese su clave: ");
            String clave = teclado.nextLine();
            System.out.println("Por favor ingrese su token: ");
            String token = teclado.nextLine();

            if (usuario.equalsIgnoreCase(USUARIO_CORRECTO) && clave.equals(CLAVE_CORRECTA) && token.equals(TOKEN_CORRECTO)) {
                System.out.println("Felicitaciones. Ud a ingresado correctamente a su homebanking");
                break;
            } else {
                intentos--;
                System.out.println("Los datos ingresados son incorrectos. Le quedan " + intentos + " intentos");
                if (intentos != 0) {
                    System.out.println("¿Desea volver a intentar? (Ingrese \"Si\" para reintentar o \"No\" para salir)");
                    String insistir = teclado.nextLine();
                    if (insistir.equalsIgnoreCase("Si")) {
                        continue;
                    } else if (insistir.equalsIgnoreCase("No")) {
                        System.out.println("Gracias por su consulta!");
                        break;
                    }
                    break;
                }
            }

        } while (intentos > 0);
        if (intentos == 0) {
            System.out.println("Ud. ha bloqueado su usuario. Diríjase a la sucursal del banco más cercana.");
        }
    }
}



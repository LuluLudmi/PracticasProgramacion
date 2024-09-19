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
        Crear una aplicaci�n que valide el ingreso a una
        plataforma Online Banking a trav�s de una clave Token.
        
        Se debe tener en cuenta lo siguiente:
        * La Clave Token debe ser un n�mero aleatorio
        de 6 d�gitos.
        * El cliente debe ingresar los campos Usuario,
        Contrase�a y Clave Token (todos obligatorios).
        * El campo Usuario no distingue min�sculas
        o may�sculas.
        * El campo Contrase�a es sensible a las
        min�sculas y may�sculas.
        La clave Token aleatoria se le informa al usuario al 
        pedirle que ingrese las credenciales.        
        * El cliente solo posee 3 intentos de logueo. 
	* Si alcanza los 3 intentos fallidos de forma
        consecutiva, la aplicaci�n deber� informar al
        usuario que debe dirigirse a la sucursal del
        banco m�s cercana para poder desbloquear
        sus credenciales.
        * Por cada intento fallido, la aplicaci�n debe
        preguntar al cliente si desea continuar
        colocando las credenciales de manera correcta.
        * Si el cliente coloca las credenciales de forma
        correcta, deber� informar que ha ingresado
        correctamente al Online Banking.
         */

        Scanner teclado = new Scanner(System.in);
        final String USUARIO_CORRECTO = "pepito";
        final String CLAVE_CORRECTA = "1234";
        final String TOKEN_CORRECTO = "456789";

        int intentos = 3;

        do {
            System.out.println("Bienvenido a su p�gina de homebanking");
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
                    System.out.println("�Desea volver a intentar? (Ingrese \"Si\" para reintentar o \"No\" para salir)");
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
            System.out.println("Ud. ha bloqueado su usuario. Dir�jase a la sucursal del banco m�s cercana.");
        }
    }
}



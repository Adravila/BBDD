import java.util.*;

public class Menu_Equipo
{
	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	/**
	*	- Añadir equipo.
	*	- Modificar equipo.
	*	- Eliminar equipo.
	*	- Asignar equipo a un cliente.
	*	- Desasignar equipo a un cliente.
	*	- Ver equipos en el sistema.
	*	- Ver qué clientes usan un equipo determinado.
	**/

	// Variables reservadas para los ejercicios
	static String ejer_nombre, ejer_descripcion;

	/**
	*	Método para acceder a las sección de ejercicios
	**/
	public static void entidad_Ejercicio()
	{
		int op = 0;
		do
		{
			System.out.println("\nChoose the action of the Exercise to be modified: ");
			System.out.println("1. Add exercise class");
			System.out.println("2. Modify exercise data");
			System.out.println("3. Delete an exercise class");
			System.out.println("4. See exercises in the system");
			System.out.println("5. Go back");

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir un ejercicio
					addEjercicio();
					break;
				case 2: // Modificar datos de ejercicio
					updateEjercicio();
					break;
				case 3: // Eliminar un ejercicio
					deleteEjercicio();
					break;
				case 4:
					mostrarEjercicios();
					break;	
				case 5:
					System.out.println("");
					break;
				default:
					System.out.println("\nWrong option, try it again.");
					break;
			}
		}while(op != 5);
	}

	/**
	*	Método para añadir un ejercicio (Menú -> Ejercicio -> Añadir ejercicio)
	**/
	public static void addEjercicio()
	{
		System.out.print("\nName of the exercise: ");
		ejer_nombre = scan.nextLine();

		System.out.print("Duration of the exercise: ");
		ejer_descripcion = scan.nextLine();
	}

	/**
	*	Método para acceder a las sección de eliminar ejercicio (Menú -> Clase Colectiva -> Eliminar clase)
	**/
	public static void deleteEjercicio()
	{
		System.out.print("\nEnter the name of exercise to be deleted: ");
		ejer_nombre = scan.nextLine();
		// Procediendo a eliminar el ejercicio
	}

	/**
	*	Método para acceder a las sección de modificar ejercicio (Menú -> Ejercicio -> Modificar ejercicio)
	**/
	public static void updateEjercicio()
	{
		System.out.print("\nEnter the name of the exercise to be modify: ");
		ejer_nombre = scan.nextLine();
		int op = 0;
		do
		{
			System.out.println("\n1. Modify name of the exercise");
			System.out.println("2. Modify duration of the exercise");
			System.out.println("3. Go back");		

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("\nEnter the exercise to modify: ");
				ejer_nombre = scan.nextLine();
				break;
			case 2:
				System.out.print("\nEnter the new duration of the exercise to be modified: ");
				ejer_descripcion = scan.nextLine();
				break;				
			case 3:
				break;
			default:
				System.out.println("\nWrong option, try it again.");
				break;																						
			}	
		}while(op != 3);

	}

	/**
	*	Método para acceder a la sección de ver ejercicios en el sistema
	*	(Menu -> Exercise -> See exercises in the system)
	**/
	public static void mostrarEjercicios()
	{

	}
}
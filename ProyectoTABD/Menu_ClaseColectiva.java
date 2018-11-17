import java.util.*;

public class Menu_ClaseColectiva
{

	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	/**
	*	- Añadir clase colectiva al sistema.
	*	- Modificar clase colectiva.
	*	- Eliminar clase colectiva.
	*	- Ver clases colectivas en el sistema.
	*	- Ver el equipo que usa una clase colectiva determinada.
	**/

	// Variables reservadas para la clase colectiva
	static String cc_fecha;
	static int cc_duracion;
	static int cc_tipo_clase;

	/**
	*	Método para acceder a las sección de clase colectiva
	**/
	public static void entidad_ClaseColectiva()
	{
		int op = 0;
		do
		{
			System.out.println("\nChoose the action of the Collective Class to be modified: ");
			System.out.println("1. Add collective class");
			System.out.println("2. Modify collective class data");
			System.out.println("3. Delete a collective class");
			System.out.println("4. See collective class in the system");
			System.out.println("5. See the team that uses a certain collective class");
			System.out.println("6. Go back");

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir una Clase Colectiva
					addClaseColectiva();
					break;
				case 2: // Modificar datos de la Clase Colectiva
					updateClaseColectiva();
					break;
				case 3: // Eliminar una Clase Colectiva
					deleteClaseColectiva();
					break;
				case 4:
					mostrarClasesColectivas();
					break;	
				case 5:
					mostrarEquipos();
					break;	
				case 6:
					System.out.println("");
					break;
				default:
					System.out.println("\nWrong option, try it again.");
					break;
			}
		}while(op != 6);
	}

	/**
	*	Método para acceder a las sección de añadir clase colectiva (Menú -> Clase Colectiva -> Añadir clase)
	**/
	public static void addClaseColectiva()
	{
		System.out.print("\nDate of the collective class: ");
		cc_fecha = scan.nextLine();

		System.out.print("Duration of the class: ");
		cc_duracion = scan.nextInt();

		System.out.print("Enter the type of class [????????????????????]: ");
		cc_tipo_clase = scan.nextInt();
	}

	/**
	*	Método para acceder a las sección de eliminar clase colectiva (Menú -> Clase Colectiva -> Eliminar clase)
	**/
	public static void deleteClaseColectiva()
	{
		System.out.print("\nEnter the date of the class to be deleted: ");
		cc_fecha = scan.nextLine();
		// Procediendo a eliminar la clase colectiva
	}

	/**
	*	Método para acceder a las sección de modificar clase colectiva (Menú -> Clase Colectiva -> Modificar clase)
	**/
	public static void updateClaseColectiva()
	{
		System.out.print("\nEnter the date of the class to be modify: ");
		cc_fecha = scan.nextLine();
		int op = 0;
		do
		{
			System.out.println("\n1. Modify date of the class");
			System.out.println("2. Modify duration of the class");
			System.out.println("3. Modify type of collective class");
			System.out.println("4. Go back");		

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("\nEnter the new date to modify: ");
				cc_fecha = scan.nextLine();
				break;
			case 2:
				System.out.print("\nEnter the new duration of the class to be modified: ");
				cc_duracion = scan.nextInt();
				break;		
			case 3:					
				System.out.print("\nEnter the new class type to be modified: ");
				cc_tipo_clase = scan.nextInt();
				break;				
			case 4:
				break;
			default:
				System.out.println("\nWrong option, try it again.");
				break;																						
			}	
		}while(op != 4);

	}

	/**
	*	Método para acceder a la sección de ver clases colectivas en el sistema
	*	(Menu -> Collective Class -> See collective class in the system)
	**/
	public static void mostrarClasesColectivas()
	{

	}

	/**
	*	Método para acceder a la sección de ver el equipo que usa una clase colectiva determinada
	*	(Menu -> Collective Class -> See the team that uses a certain collective class)
	**/
	public static void mostrarEquipos()
	{

	}
}
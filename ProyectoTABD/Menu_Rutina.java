import java.util.*;

public class Menu_Rutina
{


	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	/**
	*	- Añadir rutinas (añadir una rutina al sistema).
	*	- Modificar rutinas.
	*	- Eliminar rutinas(eliminar rutina del sistema y desasignarlas de todos los clientes que la tengan).
	*	- Asignar un ejercicio a una rutina.
	*	- Desasignar un ejercicio de una rutina.
	*	- Ver rutinas en el sistema.
	**/

	// Variables reservadas para las rutinas
	static long ru_cod_rutina;
	static String ru_proposito;
	static int ru_duracion;
	/**
	*	Método para acceder a las sección de rutinas
	**/
	public static void entidad_Rutina()
	{
		int op = 0;
		do
		{
			System.out.println("\nChoose the action of the Routine to be modified: ");
			System.out.println("1. Add routine");
			System.out.println("2. Modify routines data");
			System.out.println("3. Remove routines");
			System.out.println("4. Assign / Unassign an exercise to a routine");
			System.out.println("5. View routines in the system");
			System.out.println("6. Go back");

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir un ejercicio
					addRutina();
					break;
				case 2: // Modificar datos de ejercicio
					updateRutina();
					break;
				case 3: // Eliminar un ejercicio
					deleteRutina();
					break;
				case 4:
					int op_d;
					do
					{
						System.out.println("\nAssign / Unassign an exercise to a routine");
						System.out.println("1. Assign an exercise to a routine");
						System.out.println("2. Unassign an exercise to a routine");
						System.out.println("3. Go back");
						System.out.print("Choose: ");
						op_d = scan.nextInt();

						switch(op_d)
						{
							case 1: 
								asignarEjercicioRutina();
								break;
							case 2:
								designarEjercicioRutina();
								break;
							case 3:
								break;
						}
					}while(op_d != 3);
					break;					
				case 5:
					mostrarRutinas();
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
	*	Método para añadir una rutina (Menú -> Rutina -> Añadir rutina)
	**/
	public static void addRutina()
	{
		System.out.print("\nRoutine code: ");
		ru_cod_rutina = scan.nextLong();

		System.out.print("Routine purpose: ");
		ru_proposito = scan.nextLine();

		System.out.print("Duration of the exercise: ");
		ru_duracion = scan.nextInt();
	}

	/**
	*	Método para acceder a las sección de eliminar rutina (Menú -> Rutinas -> Eliminar rutina)
	**/
	public static void deleteRutina()
	{
		System.out.print("\nEnter the routine code to be deleted: ");
		ru_cod_rutina = scan.nextLong();
		// Procediendo a eliminar la rutina
	}

	/**
	*	Método para acceder a las sección de modificar rutina (Menú -> Ejercicio -> Modificar rutina)
	**/
	public static void updateRutina()
	{
		System.out.print("\nEnter the name of the routine to be modify: ");
		ru_cod_rutina = scan.nextLong();
		int op = 0;
		do
		{
			System.out.println("\n1. Modify routine code");
			System.out.println("2. Modify purpose of the routine");
			System.out.println("3. Modify duration of the routine");
			System.out.println("3. Go back");		

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("\nEnter the routine code to modify: ");
				ru_cod_rutina = scan.nextLong();
				break;
			case 2:
				System.out.print("\nEnter the new purpose of the routine to be modified: ");
				ru_proposito = scan.nextLine();
				break;				
			case 3:
				System.out.print("\nEnter the new duration of the routine to be modified: ");
				ru_duracion = scan.nextInt();
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
	*	Método para acceder a las sección de asignar ejercicio a una rutina 
	*	(Menú -> Rutina -> Assign an exercise to a routine)
	**/
	public static void asignarEjercicioRutina()
	{

	}

	/**
	*	Método para acceder a las sección de asignar ejercicio a una rutina 
	*	(Menú -> Rutina -> Unassign an exercise to a routine)
	**/
	public static void designarEjercicioRutina()
	{

	}


	/**
	*	Método para acceder a la sección de ver ejercicios en el sistema
	*	(Menu -> Exercise -> See exercises in the system)
	**/
	public static void mostrarRutinas()
	{

	}
}
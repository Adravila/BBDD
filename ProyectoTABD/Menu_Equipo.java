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

	// Variables reservadas para los equipos
	static long eq_cod_equipo;
	static double eq_coste;

	/**
	*	Método para acceder a las sección de equipos
	**/
	public static void entidad_Equipo()
	{
		int op = 0;
		do
		{
			System.out.println("\nChoose the action of the equipment to be modified: ");
			System.out.println("1. Add equipment");
			System.out.println("2. Modify equipment data");
			System.out.println("3. Remove equipment");
			System.out.println("4. Assign / Unassign an equipment to a customer");
			System.out.println("5. View equipments in the system");
			System.out.println("6. Go back");

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir un equipo
					addEquipo();
					break;
				case 2: // Modificar datos de equipo
					updateEquipo();
					break;
				case 3: // Eliminar un ejercicio
					deleteEquipo();
					break;
				case 4:
					int op_d;
					do
					{
						System.out.println("\nAssign / Unassign an equipment to a customer");
						System.out.println("1. Assign an equipment to a customer");
						System.out.println("2. Unassign an equipment to a customer");
						System.out.println("3. Go back");
						System.out.print("Choose: ");
						op_d = scan.nextInt();

						switch(op_d)
						{
							case 1: 
								asignarEquipoCliente();
								break;
							case 2:
								designarEquipoCliente();
								break;
							case 3:
								break;
						}
					}while(op_d != 3);
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
	*	Método para añadir un equipo (Menú -> Equipo -> Añadir equipo)
	**/
	public static void addEquipo()
	{
		System.out.print("\nEquipment code: ");
		eq_cod_equipo = scan.nextLong();

		System.out.print("Equipment cost: ");
		eq_coste = scan.nextDouble();
	}

	/**
	*	Método para acceder a las sección de eliminar equipo (Menú -> Equipo -> Eliminar equipo)
	**/
	public static void deleteEquipo()
	{
		System.out.print("\nEnter the equipment code to be deleted: ");
		eq_cod_equipo = scan.nextLong();
		// Procediendo a eliminar el equipo
	}

	/**
	*	Método para acceder a las sección de modificar equipo (Menú -> Equipo -> Modificar equipo)
	**/
	public static void updateEquipo()
	{
		System.out.print("\nEnter the name of the equipment to be modify: ");
		eq_cod_equipo = scan.nextLong();
		int op = 0;
		do
		{
			System.out.println("\n1. Modify equipment code");
			System.out.println("3. Modify cost of the equipment");
			System.out.println("3. Go back");		

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("\nEnter the equipment code to modify: ");
				eq_cod_equipo = scan.nextLong();
				break;		
			case 2:
				System.out.print("\nEnter the new cost of the equipment to be modified: ");
				eq_coste = scan.nextDouble();
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
	*	Método para acceder a las sección de asignar ejercicio a una rutina 
	*	(Menú -> Equipment -> Assign an equipment to a routine)
	**/
	public static void asignarEquipoCliente()
	{

	}

	/**
	*	Método para acceder a las sección de asignar ejercicio a una rutina 
	*	(Menú -> equipment -> Unassign an equipment to a routine)
	**/
	public static void designarEquipoCliente()
	{

	}


	/**
	*	Método para acceder a la sección de ver ejercicios en el sistema
	*	(Menu -> Equipment -> See equipments in the system)
	**/
	public static void mostrarEquipos()
	{

	}
}
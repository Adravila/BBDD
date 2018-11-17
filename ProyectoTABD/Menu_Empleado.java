import java.util.*;

public class Menu_Empleado
{
	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	static long emp_cod_emp;
	static double emp_sueldo;
	static String emp_nombre, emp_apellidos, emp_jornada_laboral;
	static long[] emp_telefono = new long[2];
	static String[] emp_direccion = new String[2];
	static int emp_tipo;

	/**
	*	Método para acceder a las sección de clientes
	**/
	public static void entidad_Empleados()
	{
		int op = 0;
		do
		{
			System.out.println("\nChoose the action of the Employee to be modified: ");
			System.out.println("1. Add employee");
			System.out.println("2. Modify employee data");
			System.out.println("3. Delete an employee");
			System.out.println("4. Assign / Unassign monitor of a collective class");
			System.out.println("5. Assign / Designate maintenance manager a machine");
			System.out.println("6. See employees in the system");
			System.out.println("7. See machines for which a maintenance worker is responsible");
			System.out.println("8. Go back");

			/**
			NOTA:
				7. Ver las máquinas de las que está encargado un empleado de mantenimiento
			**/

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir un empleado
					addEmpleado();
					break;

				case 2: // Modificar datos del empleado
					updateEmpleado();
					break;

				case 3: // Eliminar empleado
					deleteEmpleado();
					break;

				case 4:	// Asignar/Deasignar monitor de una clase colectiva	
					int op_t;
					do
					{
						System.out.println("\nAssign / Unassign monitor of a collective class: ");
						System.out.println("1. Assign monitor of a collective class");
						System.out.println("2. Unassign monitor of a collective class");
						System.out.println("3. Go back");
						System.out.print("Choose: ");
						op_t = scan.nextInt();

						switch(op_t)
						{
							case 1: 
								asignarMonitorClaseColectiva();
								break;
							case 2:
								designarMonitorClaseColectiva();
								break;
							case 3:
								break;
							default:
								System.out.println("Wrong option, try it again.\n");
								break;	
						}
					}while(op_t != 3);
					break;

				case 5:	// Asignar monitor a una clase colectiva
					do
					{
						System.out.println("\nAssign / Designate maintenance manager a machine: ");
						System.out.println("1. Assign maintenance manager a machine");
						System.out.println("2. Designate maintenance manager a machine");
						System.out.println("3. Go back");
						System.out.print("Choose: ");
						op_t = scan.nextInt();

						switch(op_t)
						{
							case 1: 
								asignarMantenimientoClaseColectiva();
								break;
							case 2:
								designarMantenimientoClaseColectiva();
								break;
							case 3: 
								break;
							default:
								System.out.println("\nWrong option, try it again.");
								break;	
						}

					}while(op_t != 3);
					break;

				case 6:
					mostrarEmpleados();
					break;	
				case 7:
					mostrarMaquinas();
					break;	
				case 8:
					System.out.println("");
					break;
				default:
					System.out.println("\nWrong option, try it again.");
					break;
			}
		}while(op != 8);
	}

	public static void addEmpleado()
	{
		System.out.print("\nName of the employee: ");
		emp_nombre = scan.nextLine();

		System.out.print("Employee's Surname: ");
		emp_apellidos = scan.nextLine();

		System.out.println("Employee address ");
			System.out.print(" - Enter the street: ");
			emp_direccion[0] = scan.nextLine();
			System.out.print(" - Enter the city: ");
			emp_direccion[1] = scan.nextLine();

		System.out.print("Enter an employee's phone: ");
		emp_telefono[0] = scan.nextLong();

		System.out.print("Enter a second employee phone: ");
		emp_telefono[1] = scan.nextLong();

		System.out.print("Enter the reason for the employee's workday: ");
		emp_jornada_laboral = scan.nextLine();

		System.out.print("Enter the employee's floor: ");
		emp_sueldo = scan.nextDouble();
		
		scan.nextLine();

		System.out.print("Enter the type of employee (1) Maintenance, (2) Monitor, (3) Boss: ");
		emp_tipo = scan.nextInt();
	}

	/**
	*	Método para acceder a las sección de eliminar cliente (Menú -> Cliente -> Eliminar cliente)
	**/
	public static void deleteEmpleado()
	{
		System.out.print("\nEnter the employee code to be deleted: ");
		emp_cod_emp = scan.nextLong();
		// Procediendo a eliminar el empleado
	}

	/**
	*	Método para acceder a las sección de modificar cliente (Menú -> Cliente -> Modificar cliente)
	**/
	public static void updateEmpleado()
	{
		System.out.print("\nEnter the employee code to be modify: ");
		emp_cod_emp = scan.nextLong();
		int op = 0;
		do
		{
			System.out.println("\n1. Modify name");
			System.out.println("2. Modify surname");
			System.out.println("3. Modify address");
			System.out.println("4. Modify phone");
			System.out.println("5. Modify workday");
			System.out.println("6. Modify salary");
			System.out.println("7. Modify type of employee");			
			System.out.println("8. Go back");		

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("\nEnter the new name to modify: ");
				emp_nombre = scan.nextLine();
				break;
			case 2:
				System.out.print("\nEnter the new surnames to be modified: ");
				emp_apellidos = scan.nextLine();
				break;							
			case 3:
				int op_d;
				do
				{
					System.out.println("\nEnter the new address to be modified: ");
					System.out.println("1. Modify street");
					System.out.println("2. Modify city");
					System.out.println("3. Go back");
					System.out.print("Choose: ");
					op_d = scan.nextInt();
					scan.nextLine();

					switch(op_d)
					{
						case 1: 
							System.out.print("\nEnter the new street to be modified: ");
							emp_direccion[0] = scan.nextLine();
							break;
						case 2:
							System.out.print("\nEnter the new city to be modified: ");
							emp_direccion[1] = scan.nextLine();
							break;
						case 3: 
							break;
						default:
							System.out.println("\nWrong option, try it again.");
							break;	
					}
				}while(op_d != 3);
				break;	
			case 4:
				int op_t;
				do
				{
					System.out.println("\nEnter the new phone to be modified: ");
					System.out.println("1. First phone");
					System.out.println("2. Second phone");
					System.out.println("3. Go back");
					System.out.print("Choose: ");
					op_t = scan.nextInt();

					switch(op_t)
					{
						case 1: 
							System.out.print("\nFirst phone to modify: ");
							emp_telefono[0] = scan.nextLong();
							break;
						case 2:
							System.out.print("\nSecond phone to modify: ");
							emp_telefono[1] = scan.nextLong();
							break;
						case 3: 
							break;
						default:
							System.out.println("\nWrong option, try it again.");
							break;	
					}

				}while(op_t != 3);
				break;	
			case 5:
				System.out.print("\nEnter the new working day to modify: ");
				emp_jornada_laboral = scan.nextLine();
				break;		
			case 6:
				System.out.print("\nEnter the new salary to be modified: ");
				emp_sueldo = scan.nextDouble();
				break;		
			case 7:
				System.out.print("\nEnter the new employee type: ");
				emp_cod_emp = scan.nextLong();
				break;				
			case 8:
				break;
			default:
				System.out.println("\nWrong option, try it again.");
				break;																						
			}	
		}while(op != 8);

	}

	/**
	*	Método para acceder a las sección de asignar rutina a un cliente 
	*	(Menu -> Employee -> Assign monitor of a collective class --)
	**/
	public static void asignarMonitorClaseColectiva()
	{

	}

	/**
	*	Método para acceder a las sección de deasignar monitor de una clase colectiva 
	*	(Menu -> Employee -> Unassign monitor of a collective class)
	**/
	public static void designarMonitorClaseColectiva()
	{

	}

	/**
	*	Método para acceder a las sección de asignar encargado de mantenimiento una maquina 
	*	(Menu -> Employee -> Assign / Designate maintenance manager a machine)
	**/
	public static void asignarMantenimientoClaseColectiva()
	{

	}

	/**
	*	Método para acceder a las sección de designar encargado de mantenimiento una maquina 
	*	(Menu -> Employee -> Designate maintenance manager a machine)
	**/
	public static void designarMantenimientoClaseColectiva()
	{

	}


	/**
	*	Método para acceder a las sección de mostrar todos los empleado 
	*	(Menu -> Employee -> See employees in the system)
	**/
	public static void mostrarEmpleados()
	{

	}

	/**
	*	Método para acceder a las sección de mostrar todas las máquinas de las que está encargado un empleado de mantenimiento 
	*	(Menu -> Employee -> See machines for which a maintenance worker is responsible)
	**/
	public static void mostrarMaquinas()
	{

	}
}
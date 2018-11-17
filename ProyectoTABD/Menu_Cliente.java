import java.util.*;


public class Menu_Cliente
{
	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	/**
	*	- Añadir un cliente.
	*	- Eliminar un cliente.
	*	- Modificar datos del cliente.
	*	- Asignarle una rutina a un cliente.
	*	- Desasignar rutina a un cliente.
	*	- Ver clientes del sistema.
	**/

	// Variables reservadas para los clientes
	static String cli_nombre, cli_apellidos, cli_dni_e;
	static long[] cli_telefono = new long[2];
	static double cli_suscripcion, cli_peso;
	static String[] cli_direccion = new String[2];

	/**
	*	Método para acceder a las sección de clientes
	**/
	public static void entidad_Clientes()
	{
		int op = 0;
		do
		{
			System.out.println("\nChoose the action of the Customer to be modified: ");
			System.out.println("1. Add customer");
			System.out.println("2. Delete a customer");
			System.out.println("3. Modify customer data");
			System.out.println("4. Assign / Unassign routine to client");
			System.out.println("5. See customers");
			System.out.println("6. Go back");

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir cliente
					addCliente();
					break;

				case 2:	// Eliminar cliente
					deleteCliente();
					break;

				case 3: // Modificar datos del cliente
					updateCliente();
					break;

				case 4:	// Asignar/Deasignar rutina a cliente	
					int op_d;
					do
					{
						System.out.println("\nAssign / Unassign routine to client ");
						System.out.println("1. Assign routine to client");
						System.out.println("2. Unassign routine to client");
						System.out.println("3. Go back");
						System.out.print("Choose: ");
						op_d = scan.nextInt();

						switch(op_d)
						{
							case 1: 
								asignarRutinaCliente();
								break;
							case 2:
								designarRutinaCliente();
								break;
						}
					}while(op_d != 3);
				break;	

				case 5:	// Ver clientes
					mostrarClientes();
					break;	
				case 6:
					break;
				default:
					System.out.println("\nWrong option, try it again.");
					break;	
			}
		}while(op != 6);
	}

	/**
	*	Método para acceder a las sección de añadir cliente (Menú -> Cliente -> Añadir cliente)
	**/
	public static void addCliente()
	{
		System.out.print("\nCustomer name: ");
		cli_nombre = scan.nextLine();

		System.out.print("Customer's Surname: ");
		cli_apellidos = scan.nextLine();

		System.out.println("Customer's address");
			System.out.print(" - Enter the street: ");
			cli_direccion[0] = scan.nextLine();
			System.out.print(" - Enter the city: ");
			cli_direccion[1] = scan.nextLine();

		System.out.print("Enter a customer's phone: ");
		cli_telefono[0] = scan.nextLong();

		System.out.print("Enter a second customer's phone: ");
		cli_telefono[1] = scan.nextLong();

		System.out.print("Enter the customer's weight: ");
		cli_peso = scan.nextDouble();

		System.out.print("Enter the customer's subscription: ");
		cli_suscripcion = scan.nextDouble();
		
		scan.nextLine();

		System.out.print("Enter the customer's DNIe: ");
		cli_dni_e = scan.nextLine();
	}

	/**
	*	Método para acceder a las sección de eliminar cliente (Menú -> Cliente -> Eliminar cliente)
	**/
	public static void deleteCliente()
	{
		System.out.print("\nEnter the DNIe of the client to be deleted: ");
		cli_dni_e = scan.nextLine();
		// Procediendo a eliminar el cliente
	}

	/**
	*	Método para acceder a las sección de modificar cliente (Menú -> Cliente -> Modificar cliente)
	**/
	public static void updateCliente()
	{
		System.out.print("\nEnter the DNIe of the client to be modify: ");
		cli_dni_e = scan.nextLine();
		int op = 0;
		do
		{
			System.out.println("1. Modify name");
			System.out.println("2. Modify surnames");
			System.out.println("3. Modify address");
			System.out.println("4. Modify phone");
			System.out.println("5. Modify weight");
			System.out.println("6. Modify subscription");			
			System.out.println("7. Modify DNIe");			
			System.out.println("8. Go back");		

			System.out.print("Choose: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("\nEnter the new name to modify: ");
				cli_nombre = scan.nextLine();
				break;
			case 2:
				System.out.print("\nEnter the new surnames to be modified: ");
				cli_apellidos = scan.nextLine();
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

					switch(op_d)
					{
						case 1: 
							System.out.print("\nEnter the new street to be modified: ");
							cli_direccion[0] = scan.nextLine();
							break;
						case 2:
							System.out.print("\nEnter the new city to be modified: ");
							cli_direccion[1] = scan.nextLine();
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
							cli_telefono[0] = scan.nextLong();
							break;
						case 2:
							System.out.print("\nSecond phone to modify: ");
							cli_telefono[1] = scan.nextLong();
							break;
						default:
							System.out.println("\nWrong option, try it again.");
							break;	
					}

				}while(op_t != 3);
				break;	
			case 5:
				System.out.print("Enter the new weight to be modified: ");
				cli_peso = scan.nextDouble();
				break;		
			case 6:
				System.out.print("Enter the new subscription to be modified: ");
				cli_suscripcion = scan.nextDouble();
				break;		
			case 7:
				System.out.print("Enter the new DNIe to be modified: ");
				cli_dni_e = scan.nextLine();
				break;
			case 8:
				System.out.println("");
				break;
			default:
				System.out.println("Wrong option, try it again.\n");
				break;		
			}	
		}while(op != 8);
	}

	/**
	*	Método para acceder a las sección de asignar rutina a un cliente 
	*	(Menú -> Cliente -> Assign routine to client)
	**/
	public static void asignarRutinaCliente()
	{

	}

	/**
	*	Método para acceder a las sección de asignar rutina a un cliente 
	*	(Menú -> Cliente -> Unassign routine to client)
	**/
	public static void designarRutinaCliente()
	{

	}


	/**
	*	Método para acceder a las sección de mostrar todos los clientes 
	*	(Menú -> Cliente -> mostar clientes)
	**/
	public static void mostrarClientes()
	{

	}
}
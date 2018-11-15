import java.util.*;

public class Menu
{
	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	// Variables reservadas para cliente
	static String cli_nombre, cli_apellidos, cli_dni_e;
	static long[] cli_telefono = new long[2];
	static double cli_suscripcion, cli_peso;
	static String[] cli_direccion = new String[2];

	// Métodos de la ENTIDAD DE CLIENTE *********************************************** //

	public static void entidad_Clientes()
	{
		int op = 0;
		do
		{
			System.out.println("Ahora, elija la accion del cliente a modificar: ");
			System.out.println("1. Añadir cliente");
			System.out.println("2. Eliminar cliente");
			System.out.println("3. Modificar datos del cliente");
			System.out.println("4. Asignar rutina a cliente");
			System.out.println("5. Desasignar rutina a cliente");
			System.out.println("6. Ver clientes");
			System.out.println("7. Volver atrás");

			System.out.print("Elegir: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
				case 1: // Añadir cliente
					addCliente();
					Cliente c = new Cliente(cli_nombre, cli_apellidos, cli_direccion, cli_telefono, cli_peso, cli_suscripcion, cli_dni_e);
					break;

				case 2:	// Eliminar cliente
					deleteCliente();
					break;

				case 3: // Modificar datos del cliente
					updateCliente();
					break;

				case 4:	// Asignar rutina a cliente	
					asignarRutinaCliente();
					break;

				case 5:	// Deasignar rutina a cliente	
					designarRutinaCliente();
					break;

				case 6:	// Ver clientes
					mostrarClientes();
					break;

				default: 
					System.out.println("");
					break;		
			}
		}while(op != 7);
	}

	public static void addCliente()
	{
		System.out.print("\nNombre del cliente: ");
		cli_nombre = scan.nextLine();

		System.out.print("Apellidos del cliente: ");
		cli_apellidos = scan.nextLine();

		System.out.println("Dirección del cliente: ");
			System.out.print(" - Introduzca la calle: ");
			cli_direccion[0] = scan.nextLine();
			System.out.print(" - Introduzca la ciudad: ");
			cli_direccion[1] = scan.nextLine();

		System.out.print("Introduzca un telefono del cliente: ");
		cli_telefono[0] = scan.nextLong();

		System.out.print("Introduzca un segundo telefono del cliente: ");
		cli_telefono[1] = scan.nextLong();

		System.out.print("Introduzca el peso del cliente: ");
		cli_peso = scan.nextDouble();

		System.out.print("Introduzca la suscripcion del cliente: ");
		cli_suscripcion = scan.nextDouble();
		
		scan.nextLine();

		System.out.print("Introduzca el DNIe del cliente: ");
		cli_dni_e = scan.nextLine();
	}

	public static void deleteCliente()
	{
		System.out.print("\nIntroduzca el DNIe del cliente a eliminar: ");
		cli_dni_e = scan.nextLine();
		// Procediendo a eliminar el cliente
	}

	public static void updateCliente()
	{
		System.out.print("\nIntroduzca el DNIe del cliente a modificar: ");
		cli_dni_e = scan.nextLine();
		int op = 0;
		do
		{
			System.out.println("1. Modificar nombre");
			System.out.println("2. Modificar apellidos");
			System.out.println("3. Modificar dirección - calle");
			System.out.println("4. Modificar dirección - ciudad");
			System.out.println("5. Modificar telefono");
			System.out.println("6. Modificar peso");
			System.out.println("7. Modificar suscripcion");			
			System.out.println("8. Modificar DNIe");			
			System.out.println("9. Volver atras");		

			System.out.print("Elegir: ");
			op = scan.nextInt();
			scan.nextLine();

			switch(op)
			{
			case 1: 
				System.out.print("Introduzca el nuevo nombre a modificar: ");
				cli_nombre = scan.nextLine();
				break;
			case 2:
				System.out.print("Introduzca los nuevos apellidos a modificar: ");
				cli_apellidos = scan.nextLine();
				break;							
			case 3:
				int op_d;
				do
				{
					System.out.println("Introduzca la nueva direccion a modificar: ");
					System.out.println("1. Modificar calle");
					System.out.println("2. Modificar ciudad");
					System.out.println("3. Volver atrás");
					System.out.print("Elegir: ");
					op_d = scan.nextInt();

					switch(op_d)
					{
						case 1: 
							System.out.print("Introduzca la nueva calle a modificar: ");
							cli_direccion[0] = scan.nextLine();
						case 2:
							System.out.print("Introduzca la nueva ciudad a modificar: ");
							cli_direccion[1] = scan.nextLine();
						default:
							System.out.println("");
							break;
					}
				}while(op_d != 3);
				break;	
			case 5:
				int op_t;
				do
				{
					System.out.println("Introduzca el nuevo telefono a modificar: ");
					System.out.println("1. Primer telefono");
					System.out.println("2. Segundo telefono");
					System.out.println("3. Volver atrás");
					System.out.print("Elegir: ");
					op_t = scan.nextInt();

					switch(op_t)
					{
						case 1: 
							System.out.print("Primer telefono a modificar: ");
							cli_telefono[0] = scan.nextLong();
						case 2:
							System.out.print("Segundo telefono a modificar: ");
							cli_telefono[1] = scan.nextLong();
						default:
							System.out.println("");
							break;
					}

				}while(op_t != 3);
				break;	
			case 6:
				System.out.print("Introduzca el nuevo peso a modificar: ");
				cli_peso = scan.nextDouble();
				break;		
			case 7:
				System.out.print("Introduzca la nueva suscripcion a modificar: ");
				cli_suscripcion = scan.nextDouble();
				break;		
			case 8:
				System.out.print("Introduzca el nuevo DNIe a modificar: ");
				cli_dni_e = scan.nextLine();
				break;	
			default: 
				System.out.println("");
				break;																						
			}	
		}while(op != 9);

	}

	public static void asignarRutinaCliente()
	{

	}

	public static void designarRutinaCliente()
	{

	}

	public static void mostrarClientes()
	{

	}

	// ENTIDAD DE EMPLEADO *********************************************** //


	public static void main(String[] args)
	{
		int op = 0;
		do
		{
			System.out.println("Elija la entidad a modificar: ");
			System.out.println("1. Cliente");
			System.out.println("2. Empleado");
			System.out.println("3. Clase colectiva");
			System.out.println("4. Ejercicio");
			System.out.println("5. Rutina");
			System.out.println("6. Equipo");
			System.out.println("7. Salir programa");

			System.out.print("Elegir: ");
			op = scan.nextInt();

			switch(op)
			{
				case 1: // Clientes
					entidad_Clientes();
					break;
				case 2: // Empleados
				case 3: // Clase_colectiva
				case 4: // Ejercicio
				case 5: // Rutina
				case 6: // Equipo
				default: 
					System.out.println("");
					break;
			}
		}while(op != 7);
	}
}

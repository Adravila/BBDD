import java.util.*;

public class Menu
{
	// Variables reservadas para los menús
	static Scanner scan = new Scanner(System.in);

	public static void main(String[] args)
	{
		int op = 0;
		System.out.println("");

		do
		{
			System.out.println("Choose the entity to be modified: ");
			System.out.println("1. Customer");
			System.out.println("2. Employee");
			System.out.println("3. Class collective");
			System.out.println("4. Exercise");
			System.out.println("5. Rutina");
			System.out.println("6. Routine");
			System.out.println("7. Exit the program");

			System.out.print("Choose: ");
			op = scan.nextInt();

			switch(op)
			{
				case 1: // Clientes
					Menu_Cliente.entidad_Clientes();
					break;
				case 2: // Empleados
					Menu_Empleado.entidad_Empleados();
					break;
				case 3: // Clase_colectiva
					break;
				case 4: // Ejercicio
					break;
				case 5: // Rutina
					break;
				case 6: // Equipo
					break;
				case 7: // Equipo
					break;
				default:
					System.out.println("\nWrong option, try it again.\n");
					break;
			}
		}while(op != 7);
	}
}

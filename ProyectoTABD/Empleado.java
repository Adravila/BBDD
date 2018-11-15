public class Empleado
{
	private long cod_empleado;
	private double sueldo;
	private String jornada_laboral;
	private String nombre, apellidos;
	private long[] telefono;
	private String[] direccion;
	private int tipo; // 1 Mantenimiento, 2 Monitor, 3 Jefe

	public Empleado(long cod_empleado, String nombre, String apellidos, String[] direccion, long[] telefono, String jornada_laboral, double sueldo)
	{
		this.cod_empleado = cod_empleado;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.direccion = direccion;
		this.telefono = telefono;
		this.jornada_laboral = jornada_laboral;
		this.sueldo = sueldo;
		this.tipo = tipo;
	}

	// Código Empleado
	public long getCODempleado()
	{
		return cod_empleado;
	}

	public void setCODempleado(long cod_empleado)
	{
		this.cod_empleado = cod_empleado;
	}

	// Nombre
	public String getNombre()
	{
		return nombre;
	}

	public void setNombre(String nombre)
	{
		this.nombre = nombre;
	}

	// Apellidos
	public String getApellidos()
	{
		return apellidos;
	}

	public void setApellidos(String apellidos)
	{
		this.apellidos = apellidos;
	}

	// Dirección
	public String getCalle()
	{
		return direccion[0];
	}

	public void setCalle(String calle)
	{
		this.direccion[0] = calle;
	}	

	public String getCiudad()
	{
		return direccion[1];
	}

	public void setCiudad(String ciudad)
	{
		this.direccion[1] = ciudad;
	}	

	// Teléfono
	public long getTelefono_1()
	{
		return telefono[0];
	}

	public void setTelefono_1(long telefono)
	{
		this.telefono[0] = telefono;
	}	

	public long getTelefono_2()
	{
		return telefono[1];
	}

	public void setTelefono_2(long telefono)
	{
		this.telefono[1] = telefono;
	}	

	// Jornada laboral
	public String getJornadaLaboral()
	{
		return jornada_laboral;
	}

	public void setJornadaLaboral(String jornada_laboral)
	{
		this.jornada_laboral = jornada_laboral;
	}	

	// Sueldo
	public double getSueldo()
	{
		return sueldo;
	}

	public void setSueldo(double sueldo)
	{
		this.sueldo = sueldo;
	}	

	// Tipo
	public int getTipo()
	{
		return tipo;
	}

	public void setTipo(int tipo)
	{
		this.tipo = tipo;
	}	

	@Override
	public String toString()
	{
		String tipo_emp = "No identificado";
		if(tipo == 0)
			tipo_emp = "Encargado de mantenimiento";
		else if(tipo == 1)
			tipo_emp = "Monitor";
		else if(tipo == 2)
			tipo_emp = "Jefe";

		return "Cod empleado: "+getCODempleado()+
			  "\nNombre: "+getNombre()+
			  "\nApellidos: "+getApellidos()+
			  "\nDireccion\n"+
			  "\n - Calle: "+getCalle()+
			  "\n - Ciudad: "+getCiudad()+
			  "\nTelefono (1): "+getTelefono_1()+
			  "\nTelefono (2): "+getTelefono_2()+
			  "\nJornada laboral: "+getJornadaLaboral()+
			  "\nSueldo: "+getSueldo()+
			  "\nTipo: "+tipo_emp;
	}
}
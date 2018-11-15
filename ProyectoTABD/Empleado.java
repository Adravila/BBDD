public class Empleado
{
	private long cod_empleado;
	private double sueldo;
	private String jornada_laboral;
	private String nombre, apellidos;
	private long[] telefono;
	private String[] direccion;
	private int tipo;

	/**
	*	@param cod_empleado Cadena de caracteres
	*	@param nombre Cadena de caracteres
	*	@param apellidos Cadena de caracteres
	*	@param direccion Vector de tipo long con un máximo de dos tipos de dirección (calle y ciudad)
	*	@param telefono Vector de tipo long con un máximo de dos teléfonos
	*	@param jornada_laboral Cadena de caracteres
	*	@param sueldo Double, sueldo del empleado
	*	@param tipo Tipo de empleado ( 1 Mantenimiento, 2 Monitor, 3 Jefe )
	*/
	public Empleado(long cod_empleado, String nombre, String apellidos, String[] direccion, long[] telefono, String jornada_laboral, double sueldo, int tipo)
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

	/**
	*	@return Devuelve el código del empleado
	*/
	public long getCODempleado()
	{
		return cod_empleado;
	}

	/**
	*	@param cod_empleado Cadena de caracteres
	*/
	public void setCODempleado(long cod_empleado)
	{
		this.cod_empleado = cod_empleado;
	}

	/**
	*	@return Devuelve el nombre del empleado
	*/
	public String getNombre()
	{
		return nombre;
	}

	/**
	*	@param nombre Cadena de caracteres
	*/
	public void setNombre(String nombre)
	{
		this.nombre = nombre;
	}

	/**
	*	@return Devuelve los apellidos
	*/
	public String getApellidos()
	{
		return apellidos;
	}

	/**
	*	@param apellidos Cadena de caracteres
	*/
	public void setApellidos(String apellidos)
	{
		this.apellidos = apellidos;
	}

	/**
	*	@return Devuelve la calle del empleado
	*/
	public String getCalle()
	{
		return direccion[0];
	}

	/**
	*	@param calle Cadena de caracteres
	*/
	public void setCalle(String calle)
	{
		this.direccion[0] = calle;
	}	

	/**
	*	@return Devuelve la ciudad del empleado
	*/
	public String getCiudad()
	{
		return direccion[1];
	}

	/**
	*	@param ciudad Cadena de caracteres
	*/
	public void setCiudad(String ciudad)
	{
		this.direccion[1] = ciudad;
	}	

	/**
	*	@return Devuelve el primer teléfono del empleado
	*/
	public long getTelefono_1()
	{
		return telefono[0];
	}

	/**
	*	@param telefono Tipo long, representa el primer teléfono
	*/
	public void setTelefono_1(long telefono)
	{
		this.telefono[0] = telefono;
	}	

	/**
	*	@return Devuelve el segundo teléfono del empleado
	*/
	public long getTelefono_2()
	{
		return telefono[1];
	}

	/**
	*	@param telefono Tipo long, representa el segundo teléfono
	*/
	public void setTelefono_2(long telefono)
	{
		this.telefono[1] = telefono;
	}	

	/**
	*	@return Devuelve información de la jornada laboral del empleado
	*/
	public String getJornadaLaboral()
	{
		return jornada_laboral;
	}

	/**
	*	@param jornada_laboral Cadena de caracteres
	*/
	public void setJornadaLaboral(String jornada_laboral)
	{
		this.jornada_laboral = jornada_laboral;
	}	

	/**
	*	@return Devuelve el sueldo del empleado
	*/
	public double getSueldo()
	{
		return sueldo;
	}

	/**
	*	@param sueldo Double, sueldo del empleado
	*/
	public void setSueldo(double sueldo)
	{
		this.sueldo = sueldo;
	}	

	/**
	*	@return Devuelve el tipo de empleado ( 1 Mantenimiento, 2 Monitor, 3 Jefe ) 
	*/
	public int getTipo()
	{
		return tipo;
	}

	/**
	*	@param tipo Tipo de empleado ( 1 Mantenimiento, 2 Monitor, 3 Jefe )
	*/
	public void setTipo(int tipo)
	{
		this.tipo = tipo;
	}	

	/**
	*	@return Devuelve la información completa del empleado
	*/
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
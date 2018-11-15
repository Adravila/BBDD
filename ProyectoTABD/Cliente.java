public class Cliente
{
	private String nombre, apellidos, dni_e;
	private long[] telefono;
	private String[] direccion;
	private double peso, suscripcion;

	/**
	*	@param nombre Cadena de caracteres
	*	@param apellidos Cadena de caracteres
	*	@param direccion Vector de tipo long con un máximo de dos tipos de dirección (calle y ciudad)
	*	@param telefono Vector de tipo long con un máximo de dos teléfonos
	*	@param peso Double, peso del cliente
	*	@param double Double, precio a pagar por la suscripción
	*	@param dni_e Cadena de caracteres, representa como el identificador de la clase Cliente
	*/
	public Cliente(String nombre, String apellidos, String[] direccion, long[] telefono, double peso, double suscripcion, String dni_e)
	{
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.direccion = direccion;
		this.telefono = telefono;
		this.peso = peso;
		this.suscripcion = suscripcion;
		this.dni_e = dni_e;
	}

	/**
	*	@return Devuelve el nombre del cliente
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
	*	@return Devuelve el apellido del cliente
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
	*	@return Devuelve la calle del cliente
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
	*	@return Devuelve la ciudad del cliente
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
	*	@return Devuelve el primer teléfono del cliente
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
	*	@return Devuelve el segundo teléfono del cliente
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
	*	@return Devuelve el peso del cliente
	*/
	public double getPeso()
	{
		return peso;
	}

	/**
	*	@param peso Tipo double, representa el peso del cliente
	*/
	public void setPeso(double peso)
	{
		this.peso = peso;
	}	

	/**
	*	@return Devuelve la suscripción del cliente
	*/
	public double getSuscripcion()
	{
		return suscripcion;
	}

	/**
	*	@param peso Tipo double, representa la suscripción del cliente
	*/
	public void setSuscripcion(double suscripcion)
	{
		this.suscripcion = suscripcion;
	}	

	/**
	*	@return Devuelve la DNI-e del cliente
	*/
	public String getDNI_e()
	{
		return dni_e;
	}

	/**
	*	@param dni_e Cadena de caracteres, representa como el identificador de la clase Cliente
	*/
	public void setDNI_e(String dni_e)
	{
		this.dni_e = dni_e;
	}	

	/**
	*	@return Devuelve la información completa del cliente
	*/
	@Override
	public String toString()
	{
		return "Nombre: "+getNombre()+
			  "\nApellidos: "+getApellidos()+
			  "\nDireccion\n"+
			  "\n - Calle: "+getCalle()+
			  "\n - Ciudad: "+getCiudad()+
			  "\nTelefono (1): "+getTelefono_1()+
			  "\nTelefono (2): "+getTelefono_2()+
			  "\nPeso: "+getPeso()+
			  "\nSuscripcion: "+getSuscripcion()+
			  "\nDNI-e: "+getDNI_e();
	}
}
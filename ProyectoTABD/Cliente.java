public class Cliente
{
	private String nombre, apellidos, dni_e;
	private long[] telefono;
	private String[] direccion;
	private double peso, suscripcion;

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

	// Peso
	public double getPeso()
	{
		return peso;
	}

	public void setPeso(double peso)
	{
		this.peso = peso;
	}	

	// Suscripción
	public double getSuscripcion()
	{
		return suscripcion;
	}

	public void setSuscripcion(double suscripcion)
	{
		this.suscripcion = suscripcion;
	}	

	// DNI-E

	public String getDNI_e()
	{
		return dni_e;
	}

	public void setDNI_e(String dni_e)
	{
		this.dni_e = dni_e;
	}	

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
public class Ejercicio
{
	private String nombre, descripcion;

	/**
	*	@param nombre Cadena de caracteres
	*	@param descripcion Cadena de caracteres
	*/
	public Ejercicio(String nombre, String descripcion)
	{
		this.nombre = nombre;
		this.descripcion = descripcion;
	}

	/**
	*	@return Devuelve el nombre del ejercicio
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
	*	@return Devuelve la descripción del ejercicio
	*/	
	public String getDescripcion()
	{
		return nombre;
	}

	/**
	*	@param descripcion Cadena de caracteres
	*/
	public void setDescripcion(String descripcion)
	{
		this.descripcion = descripcion;
	}

	/**
	*	@return Devuelve la información completa de la clase Ejercicio
	*/
	@Override
	public String toString()
	{
		return "Cod rutina: "+getNombre()+
			  "\nPropósito: "+getDescripcion();
	}
}
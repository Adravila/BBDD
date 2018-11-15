public class Ejercicio
{
	private String nombre, descripcion;

	public Ejercicio(String nombre, String descripcion)
	{
		this.nombre = nombre;
		this.descripcion = descripcion;
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

	// Descripción
	public String getDescripcion()
	{
		return nombre;
	}

	public void setDescripcion(String descripcion)
	{
		this.descripcion = descripcion;
	}

	@Override
	public String toString()
	{
		return "Cod rutina: "+getNombre()+
			  "\nPropósito: "+getDescripcion();
	}
}
public class Clase_Colectiva
{
	private String fecha;
	private int duracion; // en minutos
	private int tipo_clase;

	public Clase_Colectiva(String fecha, String proposito, int tipo_clase)
	{
		this.fecha = fecha;
		this.duracion = duracion;
		this.tipo_clase = tipo_clase;
	}

	// Código Rutina
	public String getFecha()
	{
		return fecha;
	}

	public void setFecha(String fecha)
	{
		this.fecha = fecha;
	}

	// Duración
	public int getDuracion()
	{
		return duracion;
	}

	public void setDuracion(int duracion)
	{
		this.duracion = duracion;
	}	

	// Tipo clase
	public int getTipoClase()
	{
		return tipo_clase;
	}

	public void setTipoClase(int tipo_clase)
	{
		this.tipo_clase = tipo_clase;
	}

	@Override
	public String toString()
	{
		return "Fecha: "+getFecha()+"\nDuración: "+getDuracion()+"\nTipo: "+getTipoClase();
	}
}
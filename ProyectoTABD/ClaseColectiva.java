public class ClaseColectiva
{
	private String fecha;
	private int duracion; // en minutos
	private int tipo_clase;

	/**
	*	@param fecha Cadena de caracteres
	*	@param duracion Entero, se mide en minutos
	*	@param tipo_clase Entero
	*/
	public ClaseColectiva(String fecha, int duracion, int tipo_clase)
	{
		this.fecha = fecha;
		this.duracion = duracion;
		this.tipo_clase = tipo_clase;
	}

	/**
	*	@return Devuelve la fecha de la clase colectiva
	*/
	public String getFecha()
	{
		return fecha;
	}

	/**
	*	@param fecha Cadena de caracteres
	*/
	public void setFecha(String fecha)
	{
		this.fecha = fecha;
	}

	/**
	*	@return Devuelve la duración de la clase colectiva
	*/
	public int getDuracion()
	{
		return duracion;
	}

	/**
	*	@param duracion Entero, se mide en minutos
	*/
	public void setDuracion(int duracion)
	{
		this.duracion = duracion;
	}	

	/**
	*	@return Devuelve el tipo de clase
	*/
	public int getTipoClase()
	{
		return tipo_clase;
	}

	/**
	*	@param tipo_clase Entero
	*/
	public void setTipoClase(int tipo_clase)
	{
		this.tipo_clase = tipo_clase;
	}

	/**
	*	@return Devuelve la información completa del empleado
	*/
	@Override
	public String toString()
	{
		return "Fecha: "+getFecha()+"\nDuración: "+getDuracion()+"\nTipo: "+getTipoClase();
	}
}
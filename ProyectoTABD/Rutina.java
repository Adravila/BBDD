public class Rutina
{
	private long cod_rutina;
	private String proposito;
	private int duracion;

	/**
	*	@param cod_rutina Tipo long, código de la rutina
	*	@param proposito String, número de repeticiones
	*	@param duracion Entero, duración en minutos
	*/
	public Rutina(long cod_rutina, String proposito, int duracion)
	{
		this.cod_rutina = cod_rutina;
		this.proposito = proposito;
		this.duracion = duracion;
	}

	/**
	*	@return Devuelve el código de la rutina
	*/	
	public long getCODrutina()
	{
		return cod_rutina;
	}

	/**
	*	@param cod_rutina Tipo long, código de la rutina
	*/
	public void setCODrutina(long cod_rutina)
	{
		this.cod_rutina = cod_rutina;
	}

	/**
	*	@return Devuelve el propósito de la rutina
	*/	
	public String getProposito()
	{
		return proposito;
	}

	/**
	*	@param proposito String, número de repeticiones
	*/
	public void setProposito(String proposito)
	{
		this.proposito = proposito;
	}

	/**
	*	@return Devuelve la duración de la rutina
	*/
	public int getDuracion()
	{
		return duracion;
	}

	/**
	*	@param duracion Entero, duración en minutos
	*/
	public void setDuracion(int duracion)
	{
		this.duracion = duracion;
	}	

	/**
	*	@return Devuelve la información completa de la clase Rutina
	*/
	@Override
	public String toString()
	{
		return "Cod rutina: "+getCODrutina()+
			  "\nPropósito: "+getProposito()+
			  "\nDuración"+getDuracion();
	}
}
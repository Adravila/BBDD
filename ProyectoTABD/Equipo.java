public class Equipo
{
	private long cod_equipo;
	private double coste;

	/**
	*	@param cod_equipo Tipo long, código del equipo
	*	@param coste Double, coste del equipo
	*/
	public Equipo(long cod_equipo, double coste)
	{
		this.cod_equipo = cod_equipo;
		this.coste = coste;
	}

	/**
	*	@return Devuelve el código del equipo
	*/	
	public long getCODequipo()
	{
		return cod_equipo;
	}

	/**
	*	@param cod_equipo Tipo long, código del equipo
	*/
	public void setCODequipo(long coste)
	{
		this.coste = coste;
	}	

	/**
	*	@return Devuelve el coste del equipo
	*/	
	public long getCoste()
	{
		return cod_equipo;
	}

	/**
	*	@param coste Double, coste del equipo
	*/
	public void setCoste(long coste)
	{
		this.coste = coste;
	}	

	/**
	*	@return Devuelve la información completa del equipo
	*/
	@Override
	public String toString()
	{
		return "Cod equipo: "+getCODequipo()+
			  "\nPropósito: "+getCoste();
		}
}
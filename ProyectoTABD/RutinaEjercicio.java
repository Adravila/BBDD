public class RutinaEjercicio
{
	private int n_series, n_repeticiones;

	/**
	*	@param n_series Entero, número de series
	*	@param n_repeticiones Entero, número de repeticiones
	*/
	public RutinaEjercicio(int n_series, int n_repeticiones)
	{
		this.n_series = n_series;
		this.n_repeticiones = n_repeticiones;
	}

	/**
	*	@return Devuelve el número de series
	*/
	public int getSeries()
	{
		return n_series;
	}

	/**
	*	@param n_series Entero, número de series
	*/
	public void setSeries(int n_series)
	{
		this.n_series = n_series;
	}

	/**
	*	@return Devuelve el número de repeticiones
	*/
	public int getRepeticiones()
	{
		return n_repeticiones;
	}

	/**
	*	@param n_repeticiones Entero, número de repeticiones
	*/
	public void setRepeticiones(int n_repeticiones)
	{
		this.n_repeticiones = n_repeticiones;
	}

	/**
	*	@return Devuelve la información completa de la clase Rutina-Ejercicio
	*/
	@Override
	public String toString()
	{
		return "Num series: "+getSeries()+
			  "\nNum repeticiones: "+getRepeticiones();
	}
}
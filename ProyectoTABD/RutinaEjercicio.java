public class RutinaEjercicio
{
	private int n_series, n_repeticiones;

	public RutinaEjercicio(int n_series, int n_repeticiones)
	{
		this.n_series = n_series;
		this.n_repeticiones = n_repeticiones;
	}

	// Número de series
	public int getSeries()
	{
		return n_series;
	}

	public void setSeries(int n_series)
	{
		this.n_series = n_series;
	}

	// Número de series
	public int getRepeticiones()
	{
		return n_repeticiones;
	}

	public void setRepeticiones(int n_repeticiones)
	{
		this.n_repeticiones = n_repeticiones;
	}

	@Override
	public String toString()
	{
		return "Num series: "+getSeries()+
			  "\nNum repeticiones: "+getRepeticiones();
	}
}
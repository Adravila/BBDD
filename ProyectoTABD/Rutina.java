public class Rutina
{
	private long cod_rutina;
	private String proposito;
	private int duracion; // en minutos

	public Rutina(long cod_rutina, String proposito, int duracion)
	{
		this.cod_rutina = cod_rutina;
		this.proposito = proposito;
		this.duracion = duracion;
	}

	// Código Rutina
	public long getCODrutina()
	{
		return cod_rutina;
	}

	public void setCODrutina(long cod_rutina)
	{
		this.cod_rutina = cod_rutina;
	}

	// Propósito
	public String getProposito()
	{
		return proposito;
	}

	public void setProposito(String proposito)
	{
		this.proposito = proposito;
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

	@Override
	public String toString()
	{
		return "Cod rutina: "+getCODrutina()+
			  "\nPropósito: "+getProposito()+
			  "\nDuración"+getDuracion();
	}
}
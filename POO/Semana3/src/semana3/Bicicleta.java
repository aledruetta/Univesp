package semana3;

public class Bicicleta implements EmissorCarbono {
	private String marca;
	private String modelo;
	private double preco;
	private int marchas;
	private double carbonoEmitido;
	
	public Bicicleta(String marca, String modelo, double preco, int marchas, double carbonoEmitido) {
		this.marca = marca;
		this.modelo = modelo;
		this.preco = preco;
		this.marchas = marchas;
		this.carbonoEmitido = carbonoEmitido;
	}

	public String getMarca() {
		return marca;
	}

	public String getModelo() {
		return modelo;
	}

	public double getPreco() {
		return preco;
	}

	public int getMarchas() {
		return marchas;
	}
	
	public void setMarchas(int marcha) {
		marchas = marcha;
	}
	
	public void sobeMarcha() {
		setMarchas(getMarchas() + 1);
	}
	
	public void desceMarcha() {
		setMarchas(getMarchas() - 1);
	}

	@Override
	public double getCarbonoEmitido() {
		return carbonoEmitido;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public void setCarbonoEmitido(double carbonoEmitido) {
		this.carbonoEmitido = carbonoEmitido;
	}

	@Override
	public String toString() {
		return "Bicicleta";
	}
}

package semana3;

public class Carro implements EmissorCarbono {
	private int portas;
	private String marca;
	private String modelo;
	private double preco;
	private boolean novo;
	private double renavam;
	private double carbonoEmitido;
	
	public Carro(int portas, String marca, String modelo, double preco, boolean novo, double renavam, double carbonoEmitido) {
		this.portas = portas;
		this.marca = marca;
		this.modelo = modelo;
		this.preco = preco;
		this.novo = novo;
		this.renavam = renavam;
		this.carbonoEmitido = carbonoEmitido;
	}

	public int getPortas() {
		return portas;
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

	public boolean isNovo() {
		return novo;
	}

	public double getRenavam() {
		return renavam;
	}
	
	public void pagarRenavam() {
		System.out.println("Pago RENAVAM: R$ " + getRenavam());
	}

	@Override
	public double getCarbonoEmitido() {
		return carbonoEmitido;
	}

	public void setPortas(int portas) {
		this.portas = portas;
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

	public void setNovo(boolean novo) {
		this.novo = novo;
	}

	public void setRenavam(double renavam) {
		this.renavam = renavam;
	}

	public void setCarbonoEmitido(double carbonoEmitido) {
		this.carbonoEmitido = carbonoEmitido;
	}

	@Override
	public String toString() {
		return "Carro";
	}
}

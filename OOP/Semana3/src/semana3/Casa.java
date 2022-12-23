package semana3;

public class Casa implements EmissorCarbono {
	private double area;
	private double iptu;
	private int comodos;
	private boolean quintal;
	private double preco;
	private double carbonoEmitido;

	public Casa(double area, double iptu, int comodos, boolean quintal, double preco, double carbonoEmitido) {
		this.area = area;
		this.iptu = iptu;
		this.comodos = comodos;
		this.quintal = quintal;
		this.preco = preco;
		this.carbonoEmitido = carbonoEmitido;
	}
	
	public double getArea() {
		return area;
	}

	public double getIptu() {
		return iptu;
	}

	public int getComodos() {
		return comodos;
	}

	public boolean isQuintal() {
		return quintal;
	}

	public double getPreco() {
		return preco;
	}

	public void pagaIPTU() {
		System.out.println("IPTU pago: R$ " + getIptu());
	}

	@Override
	public double getCarbonoEmitido() {
		return carbonoEmitido;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public void setIptu(double iptu) {
		this.iptu = iptu;
	}

	public void setComodos(int comodos) {
		this.comodos = comodos;
	}

	public void setQuintal(boolean quintal) {
		this.quintal = quintal;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public void setCarbonoEmitido(double carbonoEmitido) {
		this.carbonoEmitido = carbonoEmitido;
	}

	@Override
	public String toString() {
		return "Casa";
	}
}
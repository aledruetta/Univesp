package poo_semana2;

public class Paralelogramo {
	private double h;
	private double a;
	private double theta;
	
	public Paralelogramo(double h, double a, double theta) {
		this.h = h;
		this.a = a;
		this.theta = theta;
	}
	
	public double calcularArea() {
		return this.a * this.h;
	}
	
	public double calcularPerimetro() {
		return 2 * (a + h / Math.sin(this.theta));
	}
	
	public void setParalelogramo(double h, double a, double theta) {
		this.h = h;
		this.a = a;
		this.theta = theta;
	}
	
	public double getAresta() {
		return this.a;
	}
	
	public double getAltura() {
		return this.h;
	}
	
	public double getAngulo() {
		return this.theta;
	}
	
	public String toString() {
		return "Paralelogramo: { base: " + this.a + ", altura: " + this.h +
				", angulo: " + this.theta + " }";
	}
}

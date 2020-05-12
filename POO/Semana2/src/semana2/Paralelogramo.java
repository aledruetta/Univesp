package semana2;

public class Paralelogramo {
	private double h;
	private double a;
	private double theta;
	
	public Paralelogramo(double h, double a, double theta) {
		this.h = h;
		this.a = a;
		this.theta = theta;
	}
	
	public final double calcularArea() {
		return a * h;
	}
	
	public final double calcularPerimetro() {
		return 2 * (a + h / Math.sin(theta));
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
		return theta;
	}
	
	public String toString() {
		return "Paralelogramo: { base: " + a + ", altura: " + h +
				", angulo: " + theta + " }";
	}
}

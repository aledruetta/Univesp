package univesp_POO_semana2;

public class Quadrado extends Paralelogramo {
	private double a;
	
	Quadrado(double a) {
		super(a, a, Math.PI / 2);
		this.a = a;
	}
	
	public void setQuadrado(double a) {
		this.a = a;
	}
	
	public String toString() {
		return "Quadrado: { lado: " + this.a + " }";
	}
}

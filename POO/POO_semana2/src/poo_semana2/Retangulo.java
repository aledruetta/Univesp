package poo_semana2;

public class Retangulo extends Paralelogramo {
	private double a;
	private double h;
	
	Retangulo(double a, double h) {
		super(a, h, Math.PI / 2);
		this.a = a;
		this.h = h;
	}

	public void setRetangulo(double a, double h) {
		this.a = a;
		this.h = h;
	}
	
	public String toString() {
		return "Retangulo: { lado1: " + this.a + ", lado2: " + this.h + " }";
	}
}

package semana2;

public class Retangulo extends Paralelogramo {
	Retangulo(double a, double h) {
		super(a, h, Math.PI / 2.0);
	}

	public void setRetangulo(double a, double h) {
		super.setParalelogramo(h, a, Math.PI / 2.0);
	}
	
	public String toString() {
		return "Retangulo: { lado1: " + super.getAresta() + ", lado2: "
				+ super.getAltura() + " }";
	}
}

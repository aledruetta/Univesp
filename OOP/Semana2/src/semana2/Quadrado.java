package semana2;

public class Quadrado extends Paralelogramo {
	Quadrado(double a) {
		super(a, a, Math.PI / 2.0);
	}
	
	public void setQuadrado(double a) {
		super.setParalelogramo(a, a, Math.PI / 2.0);
	}
	
	public String toString() {
		return "Quadrado: { lado: " + super.getAresta() + " }";
	}
}

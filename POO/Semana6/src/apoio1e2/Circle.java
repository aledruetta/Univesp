package apoio1e2;

public class Circle extends Shape {
	
	public double raio;
	
	public Circle(double raio) {
		if (raio <= 0) {
			throw new IllegalArgumentException("O raio não pode ser nulo nem negativo.");
		}

		this.raio = raio;
	}

	@Override
	public double getArea() {
		return Math.PI * Math.pow(raio, 2);
	}

}

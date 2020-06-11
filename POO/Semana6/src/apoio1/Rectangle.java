package apoio1;

public class Rectangle extends Shape {
	
	public double altura;
	public double largura;
	
	public Rectangle(double altura, double largura) {
		if (altura <= 0 || largura <= 0) {
			throw new IllegalArgumentException("As dimensões não podem ser nulas nem negativas.");
		}

		this.altura = altura;
		this.largura = largura;
	}

	@Override
	public double getArea() {
		return altura * largura;
	}

}

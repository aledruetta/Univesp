package apoio1;

public class Triangle extends Shape {
	
	public double a;
	public double b;
	public double c;
	
	public Triangle(double a, double b, double c) {
		if (a <= 0 || b <= 0 || c <= 0) {
			throw new IllegalArgumentException("Os lados não podem ser nulos nem negativos.");
		} else if (a + b <= c || a + c <= b || b + c <= a) {
			throw new IllegalArgumentException("Um lado não pode ser maior ou igual do que a soma dos outros.");
		}
		
		this.a = a;
		this.b = b;
		this.c = c;
	}

	@Override
	public double getArea() {
		double p = (a + b + c) / 2;
		return Math.sqrt(p*(p-a)*(p-b)*(p-c));
	}

}

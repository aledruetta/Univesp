package apoio1;

public class Teste {

	public static void main(String[] args) {
		
		try {
			Rectangle rec = new Rectangle(5.2, 2.7);
			Circle cir = new Circle(3.3);
			Triangle tri = new Triangle(6, 3, 5);
		
			System.out.println(rec.getArea());
			System.out.println(cir.getArea());
			System.out.println(tri.getArea());

		} catch (IllegalArgumentException e) {
			System.out.println("Erro: " + e.getMessage());
		}

	}

}

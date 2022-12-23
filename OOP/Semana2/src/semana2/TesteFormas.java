package semana2;

public class TesteFormas {

	public static void main(String[] args) {
		
		Paralelogramo p = new Paralelogramo(4.0, 1.0, Math.PI/4);
		Retangulo r = new Retangulo(3.0, 2.0);
		Quadrado q = new Quadrado(1.0);

		Paralelogramo[] formas = {p, r, q};
		
		for (Paralelogramo forma: formas) {
			System.out.println(forma);
			System.out.println("Angulo: " + forma.getAngulo() + " radianos");
			System.out.println("Area: " + forma.calcularArea());
			System.out.println("Perímetro: " + forma.calcularPerimetro());
			System.out.println();
		}
	}

}

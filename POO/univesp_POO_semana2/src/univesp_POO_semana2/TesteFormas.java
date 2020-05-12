package univesp_POO_semana2;

public class TesteFormas {

	public static void main(String[] args) {
		
		Paralelogramo p = new Paralelogramo(10, 4, Math.PI/4);
		Retangulo r = new Retangulo(9.3, 5);
		Quadrado q = new Quadrado(6.8);

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

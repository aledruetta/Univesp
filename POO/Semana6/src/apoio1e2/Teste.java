package apoio1e2;

import java.util.*;

public class Teste {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		
		while(true) {
			System.out.print("Digite o raio do círculo: ");

			try {
				double raio = in.nextDouble();
				Circle cir = new Circle(raio);
				System.out.println("\nÁrea: " + cir.getArea() + "\n");
				break;
			} catch (InputMismatchException e) {
				System.out.println("Erro: Verifique o tipo do raio.");
				in.next();
			} catch (IllegalArgumentException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}
		
		while(true) {
			System.out.print("Digite a largura do retângulo: ");
			
			try {
				double largura = in.nextDouble();
				System.out.print("Digite a altura do retângulo: ");
				double altura = in.nextDouble();

				Rectangle rec = new Rectangle(largura, altura);
				System.out.println("\nÁrea: " + rec.getArea() + "\n");
				break;
			} catch (InputMismatchException e) {
				System.out.println("Erro: Verifique o tipo da largura e da altura.");
				in.next();
			} catch (IllegalArgumentException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}
		
		while(true) {
			
			try {
				System.out.print("Digite o lado 1 do triângulo: ");
				double a = in.nextDouble();
				System.out.print("Digite o lado 2 do triângulo: ");
				double b = in.nextDouble();
				System.out.print("Digite o lado 3 do triângulo: ");
				double c = in.nextDouble();

				Triangle tri = new Triangle(a, b, c);
				System.out.println("\nÁrea: " + tri.getArea() + "\n");
				break;

			} catch (InputMismatchException e) {
				System.out.println("Erro: Verifique o tipo dos lados.");
				in.next();
			} catch (IllegalArgumentException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}
		
		in.close();

	}

}
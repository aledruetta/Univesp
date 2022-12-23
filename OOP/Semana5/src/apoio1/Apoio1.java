package apoio1;

import java.util.Scanner;

public class Apoio1 {

	public static void main(String[] args) {
		
		// O usuário escreve uma linha ou escolhe pela frase padrão
		System.out.print("Escreva uma linha (ou Enter para entrada padrão): ");
		Scanner in = new Scanner(System.in);
		String line = in.nextLine().strip();
		in.close();
		
		if (line == "") {
			line = "As coleções em Java fornecem implementações eficientes para listas, "
					+ "conjuntos e mapas. O que são mapas?";
		}

		System.out.println("\n" + Tokenizer.get(line));

	}

}

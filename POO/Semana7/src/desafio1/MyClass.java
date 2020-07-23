package desafio1;

import java.io.FileNotFoundException;

public class MyClass {
	public static int saque(int x) throws IllegalArgumentException, FileNotFoundException {
		if (x < 0)
			throw new FileNotFoundException("Valor inválido");
		return x;
	}
}

package desafio1;

import java.io.FileNotFoundException;

public class Teste {

	public static void main(String[] args) {
		
		try {
			System.out.println(MyClass.saque(-10));
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}

}

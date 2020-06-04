package apoio1;

import java.util.*;

public class Tokenizer {
	public static Set<String> get(String linha) {
		// Separa a string em tokens, cria um objeto TreeSet e adiciona os tokens.
		
		String tokens[] = linha.split(" ");
		Set<String> tree = new TreeSet<String>();

		for (String token : tokens) {
			tree.add(token);
		}
		
		return tree;
	}
}

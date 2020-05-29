package Desafio;

public class Teste {

	public static void main(String[] args) {
		
		Telefone tel = new Telefone(12, 997881102);
		Endereco end = new Endereco("Av. Pedro I, 384", "Jardim",
				"Pindamonhangaba", "SP", 11091000);
		Contato con = new Contato("fulano@gmail.com", tel, end);
		PessoaFisica pesf = new PessoaFisica("Fulano", "A", con,
				77889900, 1122334456);
		
		// Imprimindo o logradouro
		System.out.println(pesf.getContato().getEndereco().getLogradouro());

	}

}

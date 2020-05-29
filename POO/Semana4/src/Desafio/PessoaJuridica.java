package Desafio;

public class PessoaJuridica extends PessoaAbstract {
	private int cnpj;
	
	public PessoaJuridica(String nome, String tipo, Endereco endereco, Contato contato, int cnpj) {
		super(nome, tipo, endereco, contato);
		this.cnpj = cnpj;
	}

	public int getCnpj() {
		return cnpj;
	}
}

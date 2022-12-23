package Desafio;

public final class PessoaJuridica extends PessoaAbstract {
	private int cnpj;
	
	public PessoaJuridica(String nome, String tipo, Contato contato, int cnpj) {
		super(nome, tipo, contato);
		this.cnpj = cnpj;
	}

	public int getCnpj() {
		return cnpj;
	}
}

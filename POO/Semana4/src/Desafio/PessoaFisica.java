package Desafio;

public class PessoaFisica extends PessoaAbstract {
	private int rg;
	private int cpf;
	
	public PessoaFisica(String nome, String tipo, Endereco endereco,
			Contato contato, int rg, int cpf) {
		super(nome, tipo, endereco, contato);
		this.rg = rg;
		this.cpf = cpf;
	}

	public int getRg() {
		return rg;
	}

	public int getCpf() {
		return cpf;
	}
}

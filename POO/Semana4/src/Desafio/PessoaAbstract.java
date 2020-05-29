package Desafio;

public abstract class PessoaAbstract implements Pessoa {
	private String nome;
	private String tipo;
	private Endereco endereco;
	private Contato contato;
	
	public PessoaAbstract(String nome, String tipo, Endereco endereco,
			Contato contato) {
		this.nome = nome;
		this.tipo = tipo;
		this.endereco = endereco;
		this.contato = contato;
	}

	public String getNome() {
		return nome;
	}

	public String getTipo() {
		return tipo;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public Contato getContato() {
		return contato;
	}
}

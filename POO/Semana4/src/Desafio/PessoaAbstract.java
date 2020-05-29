package Desafio;

public abstract class PessoaAbstract implements Pessoa {
	private String nome;
	private String tipo;
	private Contato contato;
	
	public PessoaAbstract(String nome, String tipo, Contato contato) {
		this.nome = nome;
		this.tipo = tipo;
		this.contato = contato;
	}

	public String getNome() {
		return nome;
	}

	public String getTipo() {
		return tipo;
	}

	public Contato getContato() {
		return contato;
	}
}

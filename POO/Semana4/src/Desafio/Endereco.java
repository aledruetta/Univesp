package Desafio;

public class Endereco {
	private String logradouro;
	private String bairro;
	private String cidade;
	private String estado;
	private int cep;
	
	public Endereco(String logradouro, String bairro, String cidade,
			String estado, int cep) {
		this.logradouro = logradouro;
		this.bairro = bairro;
		this.cidade = cidade;
		this.estado = estado;
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public String getBairro() {
		return bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public String getEstado() {
		return estado;
	}

	public int getCep() {
		return cep;
	}
}

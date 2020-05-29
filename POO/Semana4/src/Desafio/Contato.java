package Desafio;

public class Contato {
	private String email;
	private Telefone telefone;
	private Endereco endereco;
	
	public Contato(String email, Telefone telefone, Endereco endereco) {
		this.email = email;
		this.telefone = telefone;
		this.endereco = endereco;
	}

	public String getEmail() {
		return email;
	}

	public Telefone getTelefone() {
		return telefone;
	}

	public Endereco getEndereco() {
		return endereco;
	}
}

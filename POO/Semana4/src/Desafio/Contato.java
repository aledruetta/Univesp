package Desafio;

public class Contato {
	private String email;
	private Telefone telefone;
	
	public Contato(String email, Telefone telefone) {
		this.email = email;
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public Telefone getTelefone() {
		return telefone;
	}
}

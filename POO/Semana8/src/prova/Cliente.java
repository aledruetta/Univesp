package prova;

import java.sql.Date;

public class Cliente {
	
	private String cpf;
	private String nome;
	private String telefone;
	private Date dtNasc;

	public Cliente(String cpf, String nome, String telefone, Date dtNasc) {
		this.cpf = cpf;
		this.nome = nome;
		this.telefone = telefone;
		this.dtNasc = dtNasc;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Date getDtNasc() {
		return dtNasc;
	}

	public void setDtNasc(Date dtNasc) {
		this.dtNasc = dtNasc;
	}
	
}

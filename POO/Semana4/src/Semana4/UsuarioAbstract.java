package Semana4;

public abstract class UsuarioAbstract implements UsuarioInterface {
	public String login;
	public String senha;
	public UsuarioAbstract(String login, String senha) {
		this.login = login;
		this.senha = senha;
	}
	public String toString() {
		return this.login + " " + this.senha;
	}
}

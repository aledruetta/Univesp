package Semana4;

public class UsuarioConcrete extends UsuarioAbstract {
	UsuarioConcrete(String login, String senha) {
		super(login, senha);
	}

	@Override
	public String toUpper() {
		return this.toString().toUpperCase();
	}

	@Override
	public String toLower() {
		return this.toString().toLowerCase();
	}
}

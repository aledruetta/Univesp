package Semana4;

public class UsuarioTeste {

	public static void main(String[] args) {
		UsuarioConcrete usuarios[] = new UsuarioConcrete[3];
		usuarios[0] = new UsuarioConcrete("João", "123456");
		usuarios[1] = new UsuarioConcrete("Maria", "654321");
		usuarios[2] = new UsuarioConcrete("Eunice", "666666");
		for (UsuarioConcrete u : usuarios) {
			System.out.println(u.toString());
			System.out.println(u.toLower());
			System.out.println(u.toUpper());
		}
	}

}

package pergunta1;

import java.util.*;

public class TurmaH {
	
	private String nome;
	private int codigo;
	private Set<String> turma;

	public TurmaH(String nome, int codigo) {
		super();
		this.nome = nome;
		this.codigo = codigo;
		this.turma = new HashSet<String>();
	}
	
	public void adicionaAluno(String a) {
		turma.add(a);
	}
	
	public void mostraTurma() {
		System.out.println("Turma: " + nome);
		System.out.println("Código: " + codigo);
		System.out.println("Turma: " + turma.toString());
	}

}
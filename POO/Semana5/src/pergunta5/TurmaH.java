package pergunta5;

import java.util.*;

public class TurmaH {
	
	private String nome;
	private int codigo;
	private Map<Integer, String> turma;

	public TurmaH(String nome, int codigo) {
		super();
		this.nome = nome;
		this.codigo = codigo;
		this.turma = new TreeMap<Integer, String>();
	}
	
	public void adicionaAluno(Integer ra, String a) {
		turma.put(ra, a);
	}
	
	public void mostraTurma() {
		System.out.println("Turma: " + nome);
		System.out.println("Código: " + codigo);
		System.out.println("Turma: " + turma.toString());
	}

}
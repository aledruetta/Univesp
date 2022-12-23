package Apoio4;

public class Estudante implements Comparable<Estudante> {
	private int id;
	private String nome;
	private double nota;

	public Estudante(int id, String nome, double nota) {
		this.id = id;
		this.nome = nome;
		this.nota = nota;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getNota() {
		return nota;
	}
	public void setNota(double nota) {
		this.nota = nota;
	}
	public String toString() {
		return this.id + " " + this.nome + " " + this.nota;
	}

	@Override
	public int compareTo(Estudante other) {
		if (this.nota < other.getNota())
			return -1;
		else if (this.nota > other.getNota())
			return 1;
		else
			return 0;
	}
}

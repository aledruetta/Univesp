package Apoio4;

import java.util.*;

public class Turma {
	private List<Estudante> estudantes;
	private double mediaNotaTurma;
	
	public Turma() {
		this.estudantes = new ArrayList<Estudante>();
	}

	public List<Estudante> getEstudantes() {
		return estudantes;
	}

	public void setEstudantes(List<Estudante> estudantes) {
		this.estudantes = estudantes;
	}

	public double getMediaNotaTurma() {
		return mediaNotaTurma;
	}

	public void setMediaNotaTurma(double mediaNotaTurma) {
		this.mediaNotaTurma = mediaNotaTurma;
	}
	
	@Override
	public String toString() {
		return 
	}
}

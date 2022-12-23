package pergunta1;

public class TesteH {

	public static void main(String[] args) {
		
		TurmaH t = new TurmaH("POO", 001);
		t.adicionaAluno("João");
		t.adicionaAluno("Pedro");
		t.adicionaAluno("Ana");
		t.adicionaAluno("Ana");
		t.adicionaAluno("Ana");
		t.adicionaAluno("Pedro");
		t.mostraTurma();

	}

}

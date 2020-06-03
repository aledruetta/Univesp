package pergunta5;

public class TesteH {

	public static void main(String[] args) {
		
		TurmaH t = new TurmaH("POO", 001);
		t.adicionaAluno(1234, "João");
		t.adicionaAluno(1234, "Pedro");
		t.adicionaAluno(2345, "Ana");
		t.adicionaAluno(3456, "Ana");
		t.adicionaAluno(4567, "Ana");
		t.adicionaAluno(5678, "Pedro");
		t.mostraTurma();

	}

}

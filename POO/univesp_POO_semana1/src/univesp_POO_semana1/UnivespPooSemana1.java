package univesp_POO_semana1;

public class UnivespPooSemana1 {

	public static void main(String[] args) throws CloneNotSupportedException {
		
		Data dataInicio = new Data(1, 1, 2019);
		Data dataFinal = new Data(31, 12, 2019);
		
		System.out.println(dataInicio);
		System.out.println(dataFinal);
		
		dataInicio.trocarCom(dataFinal);
		
		System.out.println(dataInicio);
		System.out.println(dataFinal);

	}

}

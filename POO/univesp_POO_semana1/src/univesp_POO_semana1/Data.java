package univesp_POO_semana1;

public class Data implements Cloneable {
	int dia;
	int mes;
	int ano;
	
	public Data(int dia, int mes, int ano) {
		this.dia = dia;
		this.mes = mes;
		this.ano = ano;
	}
	
	public void setDia(int dia) {
		this.dia = dia;
	}
	
	public int getDia() {
		return this.dia;
	}
	
	public void setMes(int mes) {
		this.mes = mes;
	}
	
	public int getMes() {
		return this.mes;
	}
	
	public int getAno() {
		return this.ano;
	}
	
	public void setAno(int ano) {
		this.ano = ano;
	}
	
	public String toString() {
		return this.dia + "/" + this.mes + "/" + this.ano;
	}
	
	@Override
	public Data clone() throws CloneNotSupportedException {
		return (Data) super.clone();
	}
	
	public void trocarCom(Data data) throws CloneNotSupportedException {
		Data tmp = (Data) data.clone();
		
		data.setDia(this.dia);
		data.setMes(this.mes);
		data.setAno(this.ano);

		this.dia = tmp.getDia();
		this.mes = tmp.getMes();
		this.ano = tmp.getAno();
	}

}

package semana1;

public class Data implements Cloneable {
	private int dia;
	private int mes;
	private int ano;
	
	public Data(int dia, int mes, int ano) {
		this.dia = dia;
		this.mes = mes;
		this.ano = ano;
	}
	
	public void setData(int dia, int mes, int ano) {
		this.dia = dia;
		this.mes = mes;
		this.ano = ano;
	}
	
	public int getDia() {
		return this.dia;
	}
	
	public int getMes() {
		return this.mes;
	}
	
	public int getAno() {
		return this.ano;
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
		data.setData(this.dia, this.mes, this.ano);
		this.setData(tmp.dia, tmp.mes, tmp.ano);
	}

}

package semana3;

public class TesteCarbono {

	public static void main(String[] args) {
		Casa casa = new Casa(135.20, 50.35, 3, true, 100000.00, 0.87);
		Carro carro = new Carro(4, "Fiat", "Uno", 23000.00, false, 37.60, 0.44);
		Bicicleta bicicleta = new Bicicleta("Baiki", "RuaMax", 1200.00, 7, 0.02);
		
		EmissorCarbono items[] = new EmissorCarbono[3];
		items[0] = casa;
		items[1] = carro;
		items[2] = bicicleta;
		
		for (EmissorCarbono i : items) {
			System.out.println(i + ", carbono: " + i.getCarbonoEmitido());
		}
	}

}

export class Presupuesto {

  total: number;
  restante: number;

  constructor(total: number, restante: number) {
    this.total = total;
    this.restante = restante;
  }

  updateRestante(cantidad: number) {
    let resto = this.restante - cantidad;
    if (resto >= 0) {
      this.restante = resto;
    }
  }

  totalMayorQueCero() {
    return this.total > 0;
  }

  reset() {
    this.total = 0;
    this.restante = 0;
  }

}

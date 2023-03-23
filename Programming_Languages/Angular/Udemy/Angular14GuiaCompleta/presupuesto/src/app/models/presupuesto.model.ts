export class Presupuesto {

  total: number;
  restante: number;

  constructor(total?: number, restante?: number) {
    this.total = total ?? NaN;
    this.restante = restante ?? NaN;
  }

  updateRestante(gasto: number) {
    let resto = this.restante - gasto;
    if (resto >= 0) {
      this.restante = resto;
    }
  }

  totalEsValido() {
    return this.total > 0;
  }

}

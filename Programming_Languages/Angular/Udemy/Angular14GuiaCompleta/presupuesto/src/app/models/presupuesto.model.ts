export class Presupuesto {

  total: number;
  restante: number;

  constructor(total?: number, restante?: number) {
    this.total = total ?? NaN;
    this.restante = restante ?? NaN;
  }

  updateRestante(gasto: number): void {
    let resto = this.restante - gasto;
    if (resto >= 0) {
      this.restante = resto;
    }
  }

  totalEsValido(): boolean {
    return this.total > 0;
  }

  obtenerPorcentaje(): number {
    return 100 * (this.restante / this.total);
  }

}

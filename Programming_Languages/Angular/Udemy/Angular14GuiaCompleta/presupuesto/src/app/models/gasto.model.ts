export class Gasto {

  categoria: string;
  cantidad: number;

  constructor(categoria?: string, cantidad?: number) {
    this.categoria = categoria ?? '';
    this.cantidad = cantidad ?? NaN;
  }

  reset() {
    this.categoria = '';
    this.cantidad = NaN;
  }

  tieneRequeridos() {
    return this.cantidad !== 0 || !isNaN(this.cantidad) || this.categoria !== '';
  }

}

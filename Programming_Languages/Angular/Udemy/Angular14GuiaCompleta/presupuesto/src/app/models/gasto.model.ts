export class Gasto {

  cantidad: number;
  categoria: string;

  constructor(categoria?: string, cantidad?: number) {
    this.categoria = categoria ?? '';
    this.cantidad = cantidad ?? NaN;
  }

  reset() {
    this.categoria = '';
    this.cantidad = NaN;
  }

  tieneRequeridos() {
    return this.cantidad > 0 && this.categoria !== '';
  }

}

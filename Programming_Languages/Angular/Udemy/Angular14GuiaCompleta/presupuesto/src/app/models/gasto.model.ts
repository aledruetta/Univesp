export class Gasto {

  categoria: string;
  cantidad: number;

  constructor(categoria: string, cantidad: number) {
    this.categoria = categoria;
    this.cantidad = cantidad;
  }

  reset() {
    this.categoria = '';
    this.cantidad = 0;
  }

}

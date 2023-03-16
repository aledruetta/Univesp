export class Moneda {

  code: string;
  order: number;
  factor: number[];

  constructor(code: string, order: number, factor: number[]) {
    this.code = code;
    this.order = order;
    this.factor = factor;
  }
}

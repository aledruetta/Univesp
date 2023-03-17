const USD_ARS: number = 202.94;
const USD_BRL: number = 5.24;
const BRL_ARS: number = 38.73;

export class Moneda {

  static factors = {
    'ARS': [1, 1/USD_ARS, 1/BRL_ARS],
    'USD': [USD_ARS, 1, USD_BRL],
    'BRL': [BRL_ARS, 1/USD_BRL, 1]
  };

  code: string;
  order: number;
  factor: number[];

  constructor(code: string, order: number, factor: number[]) {
    this.code = code;
    this.order = order;
    this.factor = factor;
  }
}

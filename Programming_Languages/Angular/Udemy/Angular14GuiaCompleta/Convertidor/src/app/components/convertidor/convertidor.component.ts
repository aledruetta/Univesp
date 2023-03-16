import { Component } from '@angular/core';
import { Moneda } from 'src/app/Models/moneda';

const USD_ARS: number = 202.94;
const USD_BRL: number = 5.24;
const BRL_ARS: number = 38.73;

@Component({
  selector: 'app-convertidor',
  templateUrl: './convertidor.component.html',
  styleUrls: ['./convertidor.component.css']
})
export class ConvertidorComponent {

  monedas = [
    new Moneda('ARS', 0, [1, 1/USD_ARS, 1/BRL_ARS]),
    new Moneda('USD', 1, [USD_ARS, 1, USD_BRL]),
    new Moneda('BRL', 2, [BRL_ARS, 1/USD_BRL, 1])
  ];

  tengoTipo: Moneda = <Moneda>this.monedas.find(m => m.order === 0);
  quieroTipo: Moneda = <Moneda>this.monedas.find(m => m.order === 1);

  tengo: number = 0;
  quiero: number = 0;

  getCambio() {
    return this.tengo * this.monedas[this.tengoTipo.order].factor[this.quieroTipo.order];
  }

}

import { Component } from '@angular/core';
import { Moneda } from 'src/app/Models/moneda';

@Component({
  selector: 'app-convertidor',
  templateUrl: './convertidor.component.html',
  styleUrls: ['./convertidor.component.css']
})
export class ConvertidorComponent {

  monedas = [
    new Moneda('ARS', 0),
    new Moneda('USD', 1),
    new Moneda('BRL', 2)
  ];

  tengoTipo: Moneda = <Moneda>this.monedas.find(m => m.code === 'ARS');
  quieroTipo: Moneda = <Moneda>this.monedas.find(m => m.code === 'USD');

  tengo: number = 0;
  quiero: number = 0;

  getCambio() {
    return this.tengo * this.monedas[this.tengoTipo.order].factor[this.quieroTipo.order];
  }

}

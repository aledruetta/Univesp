import { Injectable } from '@angular/core';
import { Gasto } from '../models/gasto.model';
import { PresupuestoService } from './presupuesto.service';

@Injectable({
  providedIn: 'root'
})
export class GastoService {

  gastos: Gasto[];

  constructor(private _presupuestoService: PresupuestoService) {
    this.gastos = [];
  }

  getGastos() {
    return this.gastos;
  }

  saveGasto(gasto: Gasto) {
    let presupuesto = this._presupuestoService.getPresupuesto();
    if (presupuesto.restante >= gasto.cantidad) {
      this.gastos.push(new Gasto(gasto.categoria, gasto.cantidad));
      presupuesto.updateRestante(gasto.cantidad);
      this._presupuestoService.savePresupuesto(presupuesto);
    }
  }

}

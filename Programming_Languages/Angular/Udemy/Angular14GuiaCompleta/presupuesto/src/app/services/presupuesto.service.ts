import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Gasto } from '../models/gasto.model';
import { Presupuesto } from '../models/presupuesto.model';

@Injectable({
  providedIn: 'root'
})
export class PresupuestoService {

  private _gastos$: Subject<Gasto>;
  presupuesto: Presupuesto;

  constructor() {
    this._gastos$ = new Subject<Gasto>();
    this.presupuesto = new Presupuesto();
  }

  obtenerPresupuesto(): Presupuesto {
    return this.presupuesto;
  }

  savePresupuesto(presupuesto: Presupuesto): void {
    this.presupuesto = presupuesto;
  }

  obtenerGastos(): Observable<Gasto> {
    return this._gastos$.asObservable();
  }

  agregarGasto(gasto: Gasto): void {
    if (this.validarGasto(gasto)) {
      this._gastos$.next(gasto);
      this.presupuesto.restante -= gasto.cantidad;
    }
  }

  validarGasto(gasto: Gasto): boolean {
    return gasto.tieneRequeridos() && this.presupuesto.restante >= gasto.cantidad;
  }

}

import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Gasto } from '../models/gasto.model';
import { Presupuesto } from '../models/presupuesto.model';

@Injectable({
  providedIn: 'root'
})
export class PresupuestoService {

  private _gasto$: Subject<Gasto>;
  presupuesto: Presupuesto;

  constructor() {
    this._gasto$ = new Subject<Gasto>();
    this.presupuesto = new Presupuesto();
  }

  obtenerPresupuesto(): Presupuesto {
    return this.presupuesto;
  }

  savePresupuesto(presupuesto: Presupuesto): void {
    this.presupuesto = presupuesto;
  }

  obtenerGasto(): Observable<Gasto> {
    return this._gasto$.asObservable();
  }

  agregarGasto(gasto: Gasto): void {
    if (this.validarRestante(gasto)) {
      this._gasto$.next(gasto);
      this.presupuesto.restante -= gasto.cantidad;
    }
  }

  validarRestante(gasto: Gasto): boolean {
    return this.presupuesto.restante >= gasto.cantidad;
  }

}

import { Injectable } from '@angular/core';
import { Presupuesto } from '../models/presupuesto.model';

@Injectable({
  providedIn: 'root'
})
export class PresupuestoService {

  presupuesto: Presupuesto;

  constructor() {
    this.presupuesto = new Presupuesto(NaN, NaN);
  }

  getPresupuesto() {
    return this.presupuesto;
  }

  savePresupuesto(presupuesto: Presupuesto) {
    this.presupuesto = presupuesto;
  }

}

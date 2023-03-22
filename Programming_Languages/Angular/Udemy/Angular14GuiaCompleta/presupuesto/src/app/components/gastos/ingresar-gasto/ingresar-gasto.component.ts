import { Component } from '@angular/core';
import { Gasto } from 'src/app/models/gasto.model';
import { Presupuesto } from 'src/app/models/presupuesto.model';
import { GastoService } from 'src/app/services/gasto.service';
import { PresupuestoService } from 'src/app/services/presupuesto.service';

@Component({
  selector: 'app-ingresar-gasto',
  templateUrl: './ingresar-gasto.component.html',
  styleUrls: ['./ingresar-gasto.component.css']
})
export class IngresarGastoComponent {

  gasto: Gasto;
  error: string;

  constructor(private _presupuestoService: PresupuestoService, private _gastoService: GastoService) {
    this.gasto = new Gasto('', 0);
    this.error = '';
  }

  agregarGasto() {
    let restante = this._presupuestoService.getPresupuesto().restante;

    if (this.gasto.cantidad === 0 || this.gasto.categoria.length === 0) {
      this.error = 'Todos los campos son obligatorios';
      return;
    }
    else if (this.gasto.cantidad > restante) {
      this.error = `El valor ($ ${ this.gasto.cantidad }) supera la cantidad disponible ($ ${ restante })`;
      return;
    }

    this._gastoService.saveGasto(this.gasto);
    this.gasto.reset();
    this.error = '';
  }

  obtenerGastos() {
    return this._gastoService.getGastos();
  }

}

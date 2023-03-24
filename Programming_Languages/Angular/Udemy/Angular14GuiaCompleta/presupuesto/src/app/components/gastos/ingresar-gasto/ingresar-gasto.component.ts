import { Component } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Gasto } from 'src/app/models/gasto.model';
import { PresupuestoService } from 'src/app/services/presupuesto.service';

@Component({
  selector: 'app-ingresar-gasto',
  templateUrl: './ingresar-gasto.component.html',
  styleUrls: ['./ingresar-gasto.component.css']
})
export class IngresarGastoComponent {

  gasto: Gasto;
  error: string;

  constructor(private _presupuestoService: PresupuestoService) {
    this.gasto = new Gasto();
    this.error = '';
  }

  agregarGasto(): void {
    this._presupuestoService.agregarGasto(this.gasto);
    this.gasto = new Gasto();
  }

}

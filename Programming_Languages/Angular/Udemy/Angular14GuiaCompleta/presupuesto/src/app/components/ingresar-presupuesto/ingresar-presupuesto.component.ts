import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Presupuesto } from 'src/app/models/presupuesto.model';
import { PresupuestoService } from 'src/app/services/presupuesto.service';

@Component({
  selector: 'app-ingresar-presupuesto',
  templateUrl: './ingresar-presupuesto.component.html',
  styleUrls: ['./ingresar-presupuesto.component.css']
})
export class IngresarPresupuestoComponent {

  presupuesto: Presupuesto;
  mostrarError: boolean;

  constructor(private _presupuestoService: PresupuestoService, private _router: Router) {
    this.presupuesto = new Presupuesto();
    this.mostrarError = false;
  }

  agregarPresupuesto() {
    if (this.presupuesto.totalEsValido()) {
      this.presupuesto.restante = this.presupuesto.total;
      this._presupuestoService.savePresupuesto(this.presupuesto);
      this.mostrarError = false;
      this._router.navigate(['/gastos']);
    }
    else {
      this.mostrarError = true;
    }
  }
}

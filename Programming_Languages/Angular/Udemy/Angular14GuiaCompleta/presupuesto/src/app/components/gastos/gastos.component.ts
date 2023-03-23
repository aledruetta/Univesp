import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Presupuesto } from 'src/app/models/presupuesto.model';
import { PresupuestoService } from 'src/app/services/presupuesto.service';

@Component({
  selector: 'app-gastos',
  templateUrl: './gastos.component.html',
  styleUrls: ['./gastos.component.css']
})
export class GastosComponent implements OnInit {

  presupuesto: Presupuesto;

  constructor(private _presupuestoService: PresupuestoService, private _router: Router) {
    this.presupuesto = new Presupuesto();
  }

  ngOnInit(): void {
    this.presupuesto = this._presupuestoService.getPresupuesto();

    if (isNaN(this.presupuesto.total)) {
      this._router.navigate(['/presupuesto']);
    }
  }

}

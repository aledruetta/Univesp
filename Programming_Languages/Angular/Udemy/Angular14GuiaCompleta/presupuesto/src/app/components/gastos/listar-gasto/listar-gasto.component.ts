import { Component, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { Gasto } from 'src/app/models/gasto.model';
import { Presupuesto } from 'src/app/models/presupuesto.model';
import { PresupuestoService } from 'src/app/services/presupuesto.service';

@Component({
  selector: 'app-listar-gasto',
  templateUrl: './listar-gasto.component.html',
  styleUrls: ['./listar-gasto.component.css']
})
export class ListarGastoComponent implements OnDestroy {

  private _gastosSub: Subscription;
  presupuesto: Presupuesto;
  gastos: Gasto[];

  constructor(private _presupuestoService: PresupuestoService) {
    this._gastosSub = new Subscription();
    this.presupuesto = new Presupuesto();
    this.gastos = [];
  }

  ngOnInit(): void {
    this.presupuesto = this._presupuestoService.obtenerPresupuesto();
    this._gastosSub = this._presupuestoService.obtenerGastos().subscribe(gasto => {
      this.gastos.push(gasto);
    });
  }

  ngOnDestroy(): void {
    this._gastosSub.unsubscribe();
  }

  obtenerGastos(): Gasto[] {
    return this.gastos;
  }

  restanteColor(): string {
    const porcentage: number = this.presupuesto.obtenerPorcentaje();
    switch (true) {
      case (porcentage < 25):
        return 'alert-danger';
      case (porcentage < 50):
        return 'alert-warning';
      default:
        return 'alert-success';
    }
  }

}

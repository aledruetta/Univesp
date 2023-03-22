import { Component } from '@angular/core';
import { GastoService } from 'src/app/services/gasto.service';

@Component({
  selector: 'app-listar-gasto',
  templateUrl: './listar-gasto.component.html',
  styleUrls: ['./listar-gasto.component.css']
})
export class ListarGastoComponent {

  constructor(private _gastoService: GastoService) {

  }

  obtenerGastos() {
    return this._gastoService.getGastos();
  }

}

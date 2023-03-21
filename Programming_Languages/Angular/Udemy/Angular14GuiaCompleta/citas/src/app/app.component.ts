import { Component } from '@angular/core';
import { Cita } from './models/cita';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  listaCitas: Cita[];
  citaEliminada: Cita;

  constructor() {
    this.listaCitas = [];
    this.citaEliminada = new Cita();
  }

  agregarCita(cita: Cita) {
    cita.id = this.listaCitas.length;
    this.listaCitas.push(cita);
  }

  obtenerCitas() {
    return this.listaCitas;
  }

  eliminarCita(citaId: number) {
    this.listaCitas.splice(citaId, 1);
  }
}

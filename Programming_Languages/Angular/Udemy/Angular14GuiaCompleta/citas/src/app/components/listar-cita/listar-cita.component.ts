import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Cita } from 'src/app/models/cita';

@Component({
  selector: 'app-listar-cita',
  templateUrl: './listar-cita.component.html',
  styleUrls: ['./listar-cita.component.css']
})
export class ListarCitaComponent {

  @Input() listaCitas: Cita[];
  @Output() eliminarCitaEvent;

  constructor() {
    this.listaCitas = [];
    this.eliminarCitaEvent = new EventEmitter<number>();
  }

  eliminarCita(citaId: number) {
    this.eliminarCitaEvent.emit(citaId);
  }

}

import { Component, EventEmitter, Output } from '@angular/core';
import { Cita } from 'src/app/models/cita';

@Component({
  selector: 'app-agregar-cita',
  templateUrl: './agregar-cita.component.html',
  styleUrls: ['./agregar-cita.component.css']
})
export class AgregarCitaComponent {

  nuevaCita: Cita;
  @Output() agregarCitaEvent;

  constructor() {
    this.nuevaCita = new Cita();
    this.agregarCitaEvent = new EventEmitter<Cita>();
  }

  agregarCita() {
    this.agregarCitaEvent.emit(this.nuevaCita);
    this.nuevaCita = new Cita();
  }

}

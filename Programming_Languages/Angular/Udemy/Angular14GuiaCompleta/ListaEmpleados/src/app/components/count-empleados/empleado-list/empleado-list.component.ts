import { Component, Input } from '@angular/core';
import { Empleado } from 'src/app/Models/empleado';

@Component({
  selector: 'app-empleado-list',
  templateUrl: './empleado-list.component.html',
  styleUrls: ['./empleado-list.component.css']
})
export class EmpleadoListComponent {

  @Input() listaEmpleados: Empleado[];

  constructor() {
    this.listaEmpleados = [];
  }
}

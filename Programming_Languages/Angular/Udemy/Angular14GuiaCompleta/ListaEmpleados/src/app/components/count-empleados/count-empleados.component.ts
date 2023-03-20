import { Component, OnInit } from '@angular/core';
import { Empleado } from 'src/app/Models/empleado';

@Component({
  selector: 'app-count-empleados',
  templateUrl: './count-empleados.component.html',
  styleUrls: ['./count-empleados.component.css']
})
export class CountEmpleadosComponent implements OnInit {

  opcionesSexo: string[];
  sexoSeleccionado: string;

  constructor() {
    this.opcionesSexo = Empleado.opcionesSexo;
    this.sexoSeleccionado = this.opcionesSexo[0];
  }

  ngOnInit(): void {
    Empleado.listaEmpleados.sort((a, b) => a.legajo - b.legajo);
  }

  getListaEmpleados(sexo: string): Empleado[] {
    return Empleado.getBySexo(sexo);
  }

}

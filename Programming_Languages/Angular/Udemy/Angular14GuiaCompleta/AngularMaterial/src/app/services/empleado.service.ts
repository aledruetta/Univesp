import { Injectable } from '@angular/core';
import { Empleado } from '../models/empleado.model';
import { Observable, Subject } from 'rxjs';

const EMPLEADOS: Empleado[] = [
  { id: 1, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { id: 2, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { id: 3, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { id: 4, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { id: 5, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { id: 6, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { id: 7, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { id: 8, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { id: 9, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { id: 10, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
];

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {

  private _listaEmpleados: Empleado[];

  constructor() {
    this._listaEmpleados = EMPLEADOS;
  }

  getEmpleados(): Empleado[] {
    return this._listaEmpleados;
  }

  eliminarEmpleado(id: number) {
    const index = this._listaEmpleados.findIndex(e => e.id === id);
    this._listaEmpleados.splice(index, 1);
  }
}

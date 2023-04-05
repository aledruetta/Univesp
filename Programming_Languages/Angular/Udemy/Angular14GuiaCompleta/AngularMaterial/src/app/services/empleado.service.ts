import { Injectable } from '@angular/core';
import { Empleado } from '../models/empleado.model';
import { Observable, Subject } from 'rxjs';

const EMPLEADOS: Empleado[] = [
  { nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
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

  eliminarEmpleado(nombre: string) {
    const index = this._listaEmpleados.findIndex(e => e.nombreCompleto === nombre);
    this._listaEmpleados.splice(index, 1);
    console.log(this._listaEmpleados);
  }
}

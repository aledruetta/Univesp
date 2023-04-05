import { Injectable } from '@angular/core';
import { Empleado } from '../models/empleado.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {

  private _empleados: Empleado[];

  constructor() {
    this._empleados = [
      { id: 1, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
      { id: 2, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
    ];
  }

  getEmpleados(): Observable<Empleado[]> {
    return new Observable<Empleado[]>(observer => {
      observer.next(this._empleados.slice());
    });
  }

  eliminarEmpleado(id: number): Observable<Empleado[]> {
    const index = this._empleados.findIndex(empleado => empleado.id === id);
    this._empleados.splice(index, 1);

    return new Observable<Empleado[]>(observer => {
      observer.next(this._empleados.slice());
    });
  }

  agregarEmpleado(empleado: Empleado): Observable<Empleado[]> {
    this._empleados.push(empleado);

    return new Observable<Empleado[]>(observer => {
      observer.next(this._empleados.slice());
    });
  }

  editarEmpleado(empleado: Empleado): Observable<Empleado[]> {
    const index = this._empleados.findIndex(e => e.id === empleado.id);
    this._empleados[index] = empleado;

    return new Observable<Empleado[]>(observer => {
      observer.next(this._empleados.slice());
    });
  }

}

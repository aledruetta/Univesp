import { Injectable} from '@angular/core';
import { Empleado } from '../models/empleado.model';
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {

  private _listaEmpleados: Empleado[];
  private _empleados$: Subject<Empleado[]>;
  private _maxId: number;

  constructor() {
    this._listaEmpleados = [
      { id: 1, nombreCompleto: 'Charly García', telefono: 1234567890, correo: 'cg@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero' },
      { id: 2, nombreCompleto: 'Alberto Spinetta', telefono: 1234567890, correo: 'as@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Masculino', estadoCivil: 'Casado' },
      { id: 3, nombreCompleto: 'Silvina Garré', telefono: 1234567890, correo: 'sg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Separado' },
      { id: 4, nombreCompleto: 'Gustavo Ceratti', telefono: 1234567890, correo: 'gc@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Masculino', estadoCivil: 'Divorciado' },
      { id: 5, nombreCompleto: 'León Gieco', telefono: 1234567890, correo: 'lg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Masculino', estadoCivil: 'Viudo' },
      { id: 6, nombreCompleto: 'Adriana Varela', telefono: 1234567890, correo: 'av@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Casado' },
    ];
    this._empleados$ = new Subject<Empleado[]>();
    this._maxId = Math.max(...this._listaEmpleados.map(e => e.id));
  }

  getEmpleados(): Observable<Empleado[]> {
    return new Observable<Empleado[]>(observer => {
      observer.next(this._listaEmpleados);
    });
  }

  eliminarEmpleado(id: number): Observable<Empleado> {
    return new Observable<Empleado>(observer => {
      const index = this._listaEmpleados.findIndex(empleado => empleado.id === id);
      const empleado = this._listaEmpleados.splice(index, 1)[0];
      observer.next(empleado);
      this._empleados$.next(this._listaEmpleados);
    });
  }

  agregarEmpleado(empleado: Empleado): Observable<Empleado> {
    return new Observable<Empleado>(observer => {
      empleado.id = this.getUserId();
      this._listaEmpleados.push(empleado);
      observer.next(empleado);
      this._empleados$.next(this._listaEmpleados);
      console.log(this._listaEmpleados);
    });
  }

  editarEmpleado(empleado: Empleado): Observable<Empleado> {
    return new Observable<Empleado>(observer => {
      const index = this._listaEmpleados.findIndex(e => e.id === empleado.id);
      this._listaEmpleados[index] = empleado;
      observer.next(empleado);
      this._empleados$.next(this._listaEmpleados);
    });
  }

  getUserId(): number {
    this._maxId++;
    return this._maxId;
  }

}

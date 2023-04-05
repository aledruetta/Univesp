import { Injectable } from '@angular/core';
import { Empleado } from '../models/empleado.model';
import { Observable } from 'rxjs';

const EMPLEADOS: Empleado[] = [
  { id: 1, nombreCompleto: 'Juan Perez', telefono: 1234567890, correo: 'jp@gmail.com', fechaIngreso: new Date('2022-01-01'), sexo: 'Masculino', estadoCivil: 'Soltero/a' },
  { id: 2, nombreCompleto: 'María Gonzalez', telefono: 1234567890, correo: 'mg@gmail.com', fechaIngreso: new Date('2020-01-01'), sexo: 'Femenino', estadoCivil: 'Soltero/a' },
];

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {

  getEmpleados(): Observable<Empleado[]> {
    return new Observable<Empleado[]>(observer => {
      observer.next(EMPLEADOS);
    });
  }

  eliminarEmpleado(id: number): Observable<Empleado[]> {
    const index = EMPLEADOS.findIndex(e => e.id === id);
    EMPLEADOS.splice(index, 1);

    return new Observable<Empleado[]>(observer => {
      observer.next(EMPLEADOS);
    });
  }
}

import { Utilities } from "../components/shared/utilities/functions";

export const ESTADOS_CIVILES: string[] = ['Soltero', 'Casado', 'Separado', 'Divorciado', 'Viudo'];

export class Empleado {
  id: number;
  nombreCompleto: string;
  telefono: number;
  correo: string;
  fechaIngreso: Date;
  estadoCivil: string;
  sexo: string;

  constructor(id:number, nombreCompleto: string, telefono: number, correo: string, fechaIngreso: Date, estadoCivil: string, sexo: string) {
    this.id = id;
    this.nombreCompleto = nombreCompleto;
    this.telefono = telefono;
    this.correo = correo;
    this.fechaIngreso = fechaIngreso;
    this.estadoCivil = estadoCivil;
    this.sexo = sexo;
  }

  static mapFromObject(object: any): Empleado {
    return {
      id: 0,
      nombreCompleto: Utilities.capitalize(object.nombreCompleto),
      telefono: +object.telefono,
      correo: object.email.toLowerCase(),
      fechaIngreso: object.fechaIngreso,
      estadoCivil: object.estadoCivil,
      sexo: object.sexo
    }
  }
}

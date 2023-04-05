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
}

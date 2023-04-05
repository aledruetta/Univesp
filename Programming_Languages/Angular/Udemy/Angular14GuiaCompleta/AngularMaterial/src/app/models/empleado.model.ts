export class Empleado {
  nombreCompleto: string;
  telefono: number;
  correo: string;
  fechaIngreso: Date;
  estadoCivil: string;
  sexo: string;

  constructor(nombreCompleto: string, telefono: number, correo: string, fechaIngreso: Date, estadoCivil: string, sexo: string) {
    this.nombreCompleto = nombreCompleto;
    this.telefono = telefono;
    this.correo = correo;
    this.fechaIngreso = fechaIngreso;
    this.estadoCivil = estadoCivil;
    this.sexo = sexo;
  }
}

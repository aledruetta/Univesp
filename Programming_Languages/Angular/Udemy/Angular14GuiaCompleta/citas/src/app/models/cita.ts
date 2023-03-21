export class Cita {
  id: number;
  nombre: string;
  fecha: string;
  hora: string;
  sintomas: string;

  constructor() {
    this.id = NaN;
    this.nombre = '';
    this.fecha = '';
    this.hora = '';
    this.sintomas = '';
  }

  hasRequeridos() {
    return this.nombre.length > 0 &&
           this.fecha.length > 0 &&
           this.hora.length > 0 &&
           this.sintomas.length > 0;
  }
}

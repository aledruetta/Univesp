export class Empleado {
  static opcionesSexo: string[] = ['Todos', 'Masculino', 'Femenino'];

  static listaEmpleados: Empleado[] = [
    { legajo: 1, nombre: 'Juan', apellido: 'Pérez', sexo: 'M', salario: 5000 },
    { legajo: 2, nombre: 'María', apellido: 'Gómez', sexo: 'F', salario: 6300 },
    { legajo: 7, nombre: 'Raúl', apellido: 'Miranda', sexo: 'M', salario: 2900 },
    { legajo: 9, nombre: 'Carina', apellido: 'Ramírez', sexo: 'F', salario: 11000 },
    { legajo: 21, nombre: 'Helena', apellido: 'Gonzalez', sexo: 'F', salario: 7200 },
  ]

  legajo: number;
  nombre: string;
  apellido: string;
  sexo: string;
  salario: number;

  constructor(legajo: number, nombre: string, apellido: string, sexo: string, salario: number) {
    this.legajo = legajo;
    this.nombre = nombre;
    this.apellido = apellido;
    this.sexo = sexo;
    this.salario = salario;
  }

  static getBySexo(sexo: string): Empleado[] {
    switch (sexo) {
      case 'Masculino':
        return Empleado.listaEmpleados.filter(e => e.sexo === 'M');
      case 'Femenino':
        return Empleado.listaEmpleados.filter(e => e.sexo === 'F');
      default:
        return Empleado.listaEmpleados;
    }
  }
}

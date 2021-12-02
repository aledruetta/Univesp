// function sumar(a, b) {
//     return a + b;
// }

const sumar1: (a: number, b: number) => number = function (
  a: number,
  b: number
): number {
  return a + b;
};

const sumar3: (a: number, b: number) => number = function (a, b) {
  return a + b;
};

const sumar2 = function (a: number, b: number): number {
  return a + b;
};

// Parámetros opcionales y valores por defecto
function nombreCompleto(
  nombre: string = "Fulanito",
  apellido?: string
): string {
  if (!apellido) return nombre;
  return nombre + " " + apellido;
}

console.log(nombreCompleto());
console.log(nombreCompleto("Fulano"));
console.log(nombreCompleto("Fulano", "de Tal"));

// Parámetros REST
function nombreCompleto2(nombre: string, ...resto: string[]): string {
  return nombre + ", " + resto.join(", ");
}

console.log(nombreCompleto2("Ana", "María", "Dolores", "García", "Hector"));

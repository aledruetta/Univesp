let esMayor: boolean = false;
let edad: number = 12;
let nombre: string = "Gustavo";
let apellido: string = "López";

// Array
let numeros: number[] = [1, 2, 3, 4];

// Tupla
let sitio: [string, number] = ["Casa", 2008];

// Enum
enum Estado {
  Offline,
  Online,
}

let estado: Estado = Estado.Offline;
console.log(estado);

// Unknown
let desconocido: unknown = "Hola";
desconocido = 32;
desconocido = true;

// let conTipo: string = desconocido;           // Error!

// Any
let tipoAny: any = 123;
let conTipo: string = tipoAny;

// Void
function logger(): void {
  console.log("Logger");
}

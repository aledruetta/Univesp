let esMayor = false;
let edad = 12;
let nombre = "Gustavo";
let apellido = "López";
// Array
let numeros = [1, 2, 3, 4];
// Tupla
let sitio = ["Casa", 2008];
// Enum
var Estado;
(function (Estado) {
    Estado[Estado["Offline"] = 0] = "Offline";
    Estado[Estado["Online"] = 1] = "Online";
})(Estado || (Estado = {}));
let estado = Estado.Offline;
console.log(estado);
// Unknown
let desconocido = "Hola";
desconocido = 32;
desconocido = true;
// let conTipo: string = desconocido;           // Error!
// Any
let tipoAny = 123;
let conTipo = tipoAny;
// Void
function logger() {
    console.log("Logger");
}

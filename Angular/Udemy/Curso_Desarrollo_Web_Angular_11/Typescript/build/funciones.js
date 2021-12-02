// function sumar(a, b) {
//     return a + b;
// }
const sumar1 = function (a, b) {
    return a + b;
};
const sumar3 = function (a, b) {
    return a + b;
};
const sumar2 = function (a, b) {
    return a + b;
};
// Parámetros opcionales y valores por defecto
function nombreCompleto(nombre = "Fulanito", apellido) {
    if (!apellido)
        return nombre;
    return nombre + " " + apellido;
}
console.log(nombreCompleto());
console.log(nombreCompleto("Fulano"));
console.log(nombreCompleto("Fulano", "de Tal"));
// Parámetros REST
function nombreCompleto2(nombre, ...resto) {
    return nombre + ", " + resto.join(", ");
}
console.log(nombreCompleto2('Ana', 'María', 'Dolores', 'García', 'Hector'));

function mostrarPersona(persona) {
    console.log(persona);
}
mostrarPersona({ nombre: 'Rosa', apellido: 'García', edad: 34 });
function mostrarCoche(coche) {
    console.log(coche);
}
mostrarCoche({ marca: 'Ford', modelo: 'Sierra' });
mostrarCoche({ marca: 'Fiat', modelo: 'Uno', color: 'Blanco' });
let p1 = { x: 121, y: 84 };
class Adulto {
    constructor(nombre, apellido, edad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
    nombreCompleto() {
        return `${this.nombre} ${this.apellido}`;
    }
}
let adulto = new Adulto('Fulano', 'de Tal', 45);
console.log(adulto.nombreCompleto());

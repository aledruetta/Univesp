interface Persona {
    nombre: string;
    apellido: string;
    edad: number;
}

function mostrarPersona(persona: Persona) {
    console.log(persona);
}

mostrarPersona( {nombre: 'Rosa', apellido: 'García', edad: 34} );

interface Coche {
    marca: string;
    modelo: string;
    color?: string;         // opcional
}

function mostrarCoche(coche: Coche) {
    console.log(coche);
}

mostrarCoche({ marca: 'Ford', modelo: 'Sierra' });
mostrarCoche({ marca: 'Fiat', modelo: 'Uno', color: 'Blanco' });

// Propiedades solo lectura
interface Punto {
    readonly x: number;
    readonly y: number;
}

let p1: Punto = { x: 121, y: 84 };
// pi.x = 45;                // Error!

// Metodos
interface Humano {
    nombre: string;
    apellido: string;
    edad: number;

    nombreCompleto(): string;
}

class Adulto implements Humano {
    nombre: string;
    apellido: string;
    edad: number;

    constructor(nombre: string, apellido: string, edad: number) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }

    nombreCompleto(): string {
        return `${this.nombre} ${this.apellido}`;
    }
}

let adulto: Adulto = new Adulto('Fulano', 'de Tal', 45);
console.log(adulto.nombreCompleto());
export class Libro {
  id: number;
  titulo: string;
  publicado: number;
  imagen: string;
  escritor: number;

  constructor (id: number, titulo: string, publicado: number, imagen: string, escritor: number) {
    this.id = id;
    this.titulo = titulo;
    this.publicado = publicado;
    this.imagen = imagen;
    this.escritor = escritor;
  }
}

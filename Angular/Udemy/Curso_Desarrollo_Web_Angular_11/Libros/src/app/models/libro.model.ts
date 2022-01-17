export class Libro {

  id: number;
  titulo: string;
  genero: string;
  autorId: number;

  constructor(id: number, titulo: string, genero: string, autorId: number) {
    this.id = id;
    this.titulo = titulo;
    this.genero = genero;
    this.autorId = autorId;
  }

}

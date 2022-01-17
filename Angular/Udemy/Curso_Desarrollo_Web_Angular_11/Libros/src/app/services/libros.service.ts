import { Injectable } from '@angular/core';
import { Libro } from '../models/libro.model';
import { librosDB } from '../repositories/libros.db';

@Injectable({
  providedIn: 'root'
})
export class LibrosService {

  constructor() { }

  getByAuthor(id: number): Promise<Libro[]> {
    return new Promise((resolve, rejects) => {
      resolve(librosDB.filter(libro => libro.autorId === id))
    });
  }

  async add(libro: Libro, escritorId: number) {
    console.log(libro, escritorId);
    const existe: boolean = librosDB.some(
      l => l.titulo === libro.titulo &&
      l.genero === libro.genero
    );

    if (libro.titulo !== null && libro.genero !== null && escritorId !== null && !existe) {
      libro.id = librosDB[librosDB.length - 1].id + 1;
      libro.autorId = escritorId;
      librosDB.push(libro);
    }
  }
}

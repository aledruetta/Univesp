import { Injectable } from '@angular/core';
import { Escritor } from '../models/escritor.model';
import { escritoresDB } from '../repositories/escritores.db';

@Injectable({
  providedIn: 'root'
})
export class EscritoresService {

  constructor() {
  }

  getAll(): Promise<Escritor[]> {
    return new Promise((resolve, rejects) => resolve(escritoresDB));
  }

  async add(escritor: Escritor) {
    const listaEscritores = await this.getAll();
    const existe: boolean = listaEscritores.some(
      e => e.nombre === escritor.nombre &&
      e.pais === e.pais
    );

    if (escritor.nombre !== null && escritor.pais !== null && !existe) {
      escritor.id = listaEscritores[listaEscritores.length - 1].id + 1;
      escritoresDB.push(escritor);
    }
  }
}

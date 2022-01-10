import { Injectable } from '@angular/core';
import { ESCRITORES } from '../db/escritores.db';
import { Escritor } from '../models/escritor.model';

@Injectable({
  providedIn: 'root'
})
export class EscritoresService {

  constructor() { }

  async getAll(): Promise<Escritor[]> {
    return new Promise((resolve, reject) => {
      resolve(ESCRITORES);
    });
  }

  async getPorPais(pais: string): Promise<Escritor[]> {
    escritores: Promise<Escritor[]> = this.getAll();
    return escritores.filter(escritor => escritor.pais === pais);
  }
}

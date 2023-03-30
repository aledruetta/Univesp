import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ImagenService {

  private error$: Subject<string>;
  private terminoBusqueda$: Subject<string>;

  constructor(private http: HttpClient) {
    this.error$ = new Subject<string>();
    this.terminoBusqueda$ = new Subject<string>();
  }

  // Emite un mensaje de error
  setError(mensaje: string) {
    this.error$.next(mensaje);
  }

  // Retorna un observable que se puede subscribir
  getError(): Observable<string> {
    return this.error$.asObservable();
  }

  // Emite un termino de busqueda
  enviarTerminoBusqueda(termino: string) {
    this.terminoBusqueda$.next(termino);
  }

  // Retorna un observable que se puede subscribir
  getTerminoBusqueda(): Observable<string> {
    return this.terminoBusqueda$.asObservable();
  }

  getImagenes(termino: string, imagenesPorPagina: number, paginaActual: number): Observable<any> {
    const KEY = '';
    const URL = `https://pixabay.com/api/?key=${KEY}&q=${termino}&per_page=${imagenesPorPagina}&page=${paginaActual}`;

    return this.http.get(URL);
  }

}

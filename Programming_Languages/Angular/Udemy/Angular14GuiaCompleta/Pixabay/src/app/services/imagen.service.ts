import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ImagenService {

  private error$ = new Subject<string>();
  private terminoBusqueda$ = new Subject<string>();

  constructor(private http: HttpClient) { }

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
    const KEY = '19490852-8f039330ab67e78c28e79eb73';
    const URL = `https://pixabay.com/api/?key=${KEY}&q=${termino}&per_page=${imagenesPorPagina}&page=${paginaActual}`;
    return this.http.get(URL);
  }

}

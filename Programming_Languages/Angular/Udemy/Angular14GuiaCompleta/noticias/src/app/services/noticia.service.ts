import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class NoticiaService {

  constructor(private _http: HttpClient) {
  }

  obtenerNoticias(criteriosBusqueda: Record<string, string>): Observable<any> {
    const PAIS = criteriosBusqueda['pais'];
    const CATEGORIA = criteriosBusqueda['categoria'];
    const APIKEY = '';
    const URL = `https://newsapi.org/v2/top-headlines?country=${PAIS}&category=${CATEGORIA}&apiKey=${APIKEY}`;

    return this._http.get(URL);
  }
}

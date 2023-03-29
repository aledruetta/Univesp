import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Noticia } from '../models/noticia.model';

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

  mapNewsFromArticles(articulos: any): Noticia[] {
    return articulos.map((articulo: any) => {
      return {
        source: articulo.source.name,
        author: articulo.author,
        title: articulo.title,
        description: articulo.description,
        url: articulo.url,
        urlToImage: articulo.urlToImage,
        date: articulo.publishedAt,
        content: articulo.content,
      };
    });
  }

}

import { Component } from '@angular/core';
import { Noticia } from './models/noticia.model';
import { NoticiaService } from './services/noticia.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  noticias: Noticia[];
  spinner: boolean;

  constructor(private _noticiasService: NoticiaService) {
    this.noticias = [];
    this.spinner = false;
  }

  getNews(criteriosBusqueda: Record<string,string>): void {
    this.spinner = true;
    setTimeout(() => {
      this._noticiasService.getNews(criteriosBusqueda)
        .subscribe({
          next: (resultado) => {
            this.spinner = false;
            this.noticias = [];
            this.noticias = this._noticiasService.mapNewsFromArticles(resultado.articles);
          },
          error: (error) => {
            this.spinner = false;
            console.log(error);
          }
        });
    }, 1000);
  }
}

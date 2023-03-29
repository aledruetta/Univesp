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

  constructor(private _noticiasService: NoticiaService) {
    this.noticias = [];
  }

  obtenerNoticias(criteriosBusqueda: Record<string,string>): void {
    this._noticiasService.obtenerNoticias(criteriosBusqueda)
      .subscribe((resultado) => {
        this.noticias = this._noticiasService.mapNewsFromArticles(resultado.articles);
      }
    );
  }
}

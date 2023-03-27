import { Component } from '@angular/core';
import { NoticiaService } from './services/noticia.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  noticias: any;

  constructor(private _noticiasService: NoticiaService) {
  }

  buscarNoticias(criteriosBusqueda: Record<string,string>): void {
    this._noticiasService.obtenerNoticias(criteriosBusqueda)
      .subscribe((noticias) => {
        this.noticias = noticias;
      }
    );
  }
}

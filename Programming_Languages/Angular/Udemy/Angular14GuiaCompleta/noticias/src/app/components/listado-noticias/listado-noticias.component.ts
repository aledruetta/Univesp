import { Component, Input } from '@angular/core';
import { Noticia } from 'src/app/models/noticia.model';

@Component({
  selector: 'app-listado-noticias',
  templateUrl: './listado-noticias.component.html',
  styleUrls: ['./listado-noticias.component.css']
})
export class ListadoNoticiasComponent {

  @Input() noticias: Noticia[];

  constructor() {
    this.noticias = [];
  }

}

import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'MiPrimeraApp';
  peliculas: string[];
  campoTextoInicial: string;
  campoTexto: string;

  constructor() {
    this.peliculas = ['Jurassic Park', 'Star War', 'Jumanji'];
    this.campoTextoInicial = 'Valor inicial';
    this.campoTexto = this.campoTextoInicial;
  }

  onClick() {
    this.campoTexto = this.campoTextoInicial;
  }
}

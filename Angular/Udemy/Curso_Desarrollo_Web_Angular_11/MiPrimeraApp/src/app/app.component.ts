import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'MiPrimeraApp';
  peliculas: string[];

  constructor() {
    this.peliculas = ['Jurassic Park', 'Star War', 'Jumanji'];
  }
}

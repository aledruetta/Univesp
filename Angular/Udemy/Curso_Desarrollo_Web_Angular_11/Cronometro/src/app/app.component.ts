import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Cronometro';
  iniciales: number[];

  constructor() {
    this.iniciales = [5, 8, 11, 14];
  }

  onFin($event: any) {
    console.log($event);
  }
}

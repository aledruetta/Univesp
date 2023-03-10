import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  dadoIzquierda = '../assets/img/dice1.png';
  dadoDerecha = '../assets/img/dice4.png';

  numero1: number = 1;
  numero2: number = 2;

  tirarDados() {
    this.numero1 = Math.ceil(Math.random() * 6);
    this.numero2 = Math.ceil(Math.random() * 6);

    this.dadoIzquierda = `../assets/img/dice${this.numero1}.png`;
    this.dadoDerecha = `../assets/img/dice${this.numero2}.png`;
  }
}

import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-semaforo',
  templateUrl: './semaforo.component.html',
  styleUrls: ['./semaforo.component.css'],
})
export class SemaforoComponent implements OnInit {
  clase: string;
  mostrar: boolean;

  constructor() {
    this.clase = '';
    this.mostrar = true;
  }

  ngOnInit(): void {
    this.cambiarColor();
  }

  cambiarColor() {
    let i = 0;
    setInterval(() => {
      let clases = ['red', 'yellow', 'green'];
      this.clase = clases[i++ % 3];
    }, 1000);
  }

  toggle() {
    this.mostrar = !this.mostrar;
  }
}

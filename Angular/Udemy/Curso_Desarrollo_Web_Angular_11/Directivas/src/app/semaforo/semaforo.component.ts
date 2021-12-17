import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-semaforo',
  templateUrl: './semaforo.component.html',
  styleUrls: ['./semaforo.component.css'],
})
export class SemaforoComponent implements OnInit {
  clase: string;

  constructor() {
    this.clase = '';
  }

  ngOnInit(): void {
    this.cambiarColor();
  }

  cambiarColor() {
    let i = 0;
    setInterval(() => {
      let clases = ['red', 'yellow', 'green'];
      this.clase = clases[i % 3];
      i++;
    }, 3000);
  }
}

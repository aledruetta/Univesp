import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-cronometro',
  templateUrl: './cronometro.component.html',
  styleUrls: ['./cronometro.component.css'],
})
export class CronometroComponent implements OnInit {
  initValue: number;

  constructor() {
    this.initValue = 10;
  }

  ngOnInit(): void {}

  startCronometro() {
    if (this.initValue < 10) {
      this.stopCronometro();
      this.initValue = 10;
    } else {
      let intervalo = setInterval(() => {
        this.initValue--;
        if (this.initValue <= 0) {
          clearInterval(intervalo);
        }
      }, 1000);
    }
  }

  stopCronometro() {
    for (let i = 0; i < 99999; i++) {
      clearInterval(i);
    }
  }
}

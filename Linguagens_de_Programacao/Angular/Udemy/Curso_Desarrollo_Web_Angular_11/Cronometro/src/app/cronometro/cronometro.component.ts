import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-cronometro',
  templateUrl: './cronometro.component.html',
  styleUrls: ['./cronometro.component.css']
})
export class CronometroComponent implements OnInit {
  @Input() inicio: number;
  @Output() fin: EventEmitter<string>;
  contador: number;

  constructor() {
    this.inicio = 0;
    this.fin = new EventEmitter();
    this.contador = 0;
  }

  ngOnInit(): void {
    this.contador = this.inicio ? this.inicio : 10;
  }

  onClick() {
    let interval = setInterval(() => {
      this.contador--;
      if (this.contador < 0) {
        clearInterval(interval);
        this.fin.emit(`Finaliza el cronómetro ${this.contador + 1}`);
        this.contador = this.inicio;
      }
    }, 1000);
  }
}

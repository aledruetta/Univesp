import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-sumar',
  templateUrl: './sumar.component.html',
  styleUrls: ['./sumar.component.css'],
})
export class SumarComponent implements OnInit {
  @Input() numA: number;
  @Input() numB: number;

  resultadoSuma: number;

  constructor() {
    this.numA = 0;
    this.numB = 0;
    this.resultadoSuma = 0;
  }

  ngOnInit(): void {}

  getSuma(): void {
    this.resultadoSuma = this.numA + this.numB;
  }
}

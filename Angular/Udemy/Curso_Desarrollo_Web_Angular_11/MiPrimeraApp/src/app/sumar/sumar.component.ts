import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sumar',
  templateUrl: './sumar.component.html',
  styleUrls: ['./sumar.component.css'],
})
export class SumarComponent implements OnInit {
  numA: number;
  numB: number;
  resultadoSuma: number;

  constructor() {
    this.numA = 78;
    this.numB = 3;
    this.resultadoSuma = 0;
  }

  ngOnInit(): void {}

  getSuma(): void {
    this.resultadoSuma = this.numA + this.numB;
  }
}

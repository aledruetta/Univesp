import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sumar',
  templateUrl: './sumar.component.html',
  styleUrls: ['./sumar.component.css']
})
export class SumarComponent implements OnInit {

  numA: number = 78;
  numB: number = 3;
  resultadoSuma: number = 0;

  constructor() { }

  getSuma(): void {
    this.resultadoSuma = this.numA + this.numB;
  }

  ngOnInit(): void {
  }

}

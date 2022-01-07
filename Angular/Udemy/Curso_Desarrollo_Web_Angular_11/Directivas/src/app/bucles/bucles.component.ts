import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-bucles',
  templateUrl: './bucles.component.html',
  styleUrls: ['./bucles.component.css']
})
export class BuclesComponent implements OnInit {
  personas: any[];

  constructor() {
    this.personas = [
      { nombre: 'Mario', apellido: 'Girón', edad: 36},
      { nombre: 'César', apellido: 'Fernandez', edad: 37},
      { nombre: 'María', apellido: 'Von Newman', edad: 56},
      { nombre: 'Andrea', apellido: 'Decard', edad: 23},
      { nombre: 'Juan', apellido: 'Moore', edad: 16}
    ];
  }

  ngOnInit(): void {
  }

}

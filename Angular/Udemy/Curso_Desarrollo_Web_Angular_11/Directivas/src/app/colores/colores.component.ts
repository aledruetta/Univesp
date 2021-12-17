import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-colores',
  templateUrl: './colores.component.html',
  styleUrls: ['./colores.component.css']
})
export class ColoresComponent implements OnInit {

  cuadrado: any;
  rango: number;

  constructor() {
    this.cuadrado = {'backgroundColor': 'red', 'width': '100px', 'height': '100px'};
    this.rango = 0;
  }

  ngOnInit(): void {
  }

  cambiaColor(color: string) {
    this.cuadrado.backgroundColor = color;
  }

  onChange($event: any) {
    this.rango = $event.target.value;
    this.cuadrado.width = this.rango + 'px';
    this.cuadrado.height = this.rango + 'px';
  }
}

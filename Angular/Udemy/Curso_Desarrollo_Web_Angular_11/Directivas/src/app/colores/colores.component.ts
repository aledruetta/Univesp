import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-colores',
  templateUrl: './colores.component.html',
  styleUrls: ['./colores.component.css']
})
export class ColoresComponent implements OnInit {

  colorDeFondo: any;

  constructor() {
    this.colorDeFondo = {'backgroundColor': 'red'};
  }

  ngOnInit(): void {
  }

  cambiaColor(color: string) {
    this.colorDeFondo.backgroundColor = color;
  }
}

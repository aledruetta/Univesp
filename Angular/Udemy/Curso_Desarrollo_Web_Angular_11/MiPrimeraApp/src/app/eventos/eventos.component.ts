import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-eventos',
  templateUrl: './eventos.component.html',
  styleUrls: ['./eventos.component.css']
})
export class EventosComponent implements OnInit {
  mensaje: string;

  constructor() {
    this.mensaje = "";
  }

  clicar(): void {
    console.log('Se ha pulsado el botón!');
  }

  getOption($event: any): void {
    console.log($event.target.value);
  }

  getMouseEnter(): void {
    this.mensaje = "Entró en el Div!";
  }

  getMouseOut(): void {
    this.mensaje = "";
  }

  ngOnInit(): void {
  }

}

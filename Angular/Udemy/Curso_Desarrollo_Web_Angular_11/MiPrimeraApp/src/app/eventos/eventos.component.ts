import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-eventos',
  templateUrl: './eventos.component.html',
  styleUrls: ['./eventos.component.css']
})
export class EventosComponent implements OnInit {

  constructor() { }

  clicar(): void {
    console.log('Se ha pulsado el botón!');
  }

  ngOnInit(): void {
  }

}

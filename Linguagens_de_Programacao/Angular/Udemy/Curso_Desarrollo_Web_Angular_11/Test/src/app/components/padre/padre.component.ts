import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-padre',
  templateUrl: './padre.component.html',
  styleUrls: ['./padre.component.css'],
})
export class PadreComponent implements OnInit {
  padreDijo: string;

  hijoDijo: string;

  constructor() {
    this.padreDijo = 'Hola hijo!';

    this.hijoDijo = '';
  }

  ngOnInit(): void {}

  onAlert($event: any) {
    this.hijoDijo = $event;

    console.log('En función onHijoDice()');
  }
}

import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-hijo',
  templateUrl: './hijo.component.html',
  styleUrls: ['./hijo.component.css'],
})
export class HijoComponent implements OnInit {
  @Input() padreDijo: string;

  @Output() alert: EventEmitter<string>;

  constructor() {
    this.padreDijo = '';

    this.alert = new EventEmitter();
  }

  ngOnInit(): void {}

  onClick() {
    this.alert.emit('Hola Padre!');

    console.log('En función onClick()');
  }
}

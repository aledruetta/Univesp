import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-hijo',
  templateUrl: './hijo.component.html',
  styleUrls: ['./hijo.component.css']
})
export class HijoComponent implements OnInit {
  @Input() padreDijo: string;
  @Output() hijoDice: EventEmitter<string>;

  constructor() {
    this.padreDijo = '';
    this.hijoDice = new EventEmitter();
  }

  ngOnInit(): void {
  }

  onClick() {
    this.hijoDice.emit('Hola Padre!');
    console.log("En función decir()");
  }

}

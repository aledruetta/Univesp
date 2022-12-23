import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-alerta',
  templateUrl: './alerta.component.html',
  styleUrls: ['./alerta.component.css'],
})
export class AlertaComponent implements OnInit {
  @Input() mensaje: string;

  constructor() {
    this.mensaje = 'Título por defecto';
  }

  ngOnInit(): void {}
}

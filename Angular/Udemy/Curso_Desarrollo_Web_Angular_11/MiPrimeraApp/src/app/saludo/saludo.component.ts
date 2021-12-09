import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-saludo',
  templateUrl: './saludo.component.html',
  styleUrls: ['./saludo.component.css']
})
export class SaludoComponent implements OnInit {

  mensaje: string;
  idParrafo: string;

  constructor() {
    this.mensaje = 'Un saludo a todos';
    this.idParrafo = 'parrafoPrincipal';

    this.cambiarMensaje();
  }

  mostrarSaludo(): string {
    return 'Saludo desde el método';
  }

  cambiarMensaje(): void {
    setTimeout(() => {
      this.mensaje = 'Otro mensaje diferente';
      this.idParrafo = 'main';
    }, 3000);
  }

  ngOnInit(): void {
  }

}

import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  students: any[] = [
    { name: 'Tomás Gonzales', state: 'Promocionado'},
    { name: 'Lucas Pérez', state: 'Regular'},
    { name: 'Susana Vaca', state: 'Libre'},
    { name: 'Juan García', state: 'Regular'}
  ]

  mostrarTable: boolean = true;
  btnTitle: string = 'Ocultar Tabla';

  toggle() {
    this.mostrarTable = !this.mostrarTable;
    this.btnTitle = this.mostrarTable ? 'Ocultar Tabla' : 'Mostrar Tabla';
  }
}

import { Component } from '@angular/core';
import { Tarea } from 'src/app/models/tarea';

@Component({
  selector: 'app-tareas',
  templateUrl: './tareas.component.html',
  styleUrls: ['./tareas.component.css']
})
export class TareasComponent {
  tareas: Tarea[] = [];
  nombreTarea: string = '';
  editable: number = NaN;

  agregarTarea() {
    this.tareas.push(new Tarea(this.nombreTarea, false));
    this.nombreTarea = '';
  }

  editarTarea(index: number) {
    this.editable = this.editable !== index ? index : NaN;
  }

  completarTarea(index: number) {
    this.tareas[index].estado = !this.tareas[index].estado;
  }

  eliminarTarea(index: number) {
    this.tareas.splice(index, 1);
  }
}

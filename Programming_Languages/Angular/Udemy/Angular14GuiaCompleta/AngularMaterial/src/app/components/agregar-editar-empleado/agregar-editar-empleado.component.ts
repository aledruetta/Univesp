import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ESTADOS_CIVILES, Empleado } from 'src/app/models/empleado.model';
import { EmpleadoService } from 'src/app/services/empleado.service';
import { Utilities } from '../shared/utilities/functions';

@Component({
  selector: 'app-agregar-editar-empleado',
  templateUrl: './agregar-editar-empleado.component.html',
  styleUrls: ['./agregar-editar-empleado.component.css']
})
export class AgregarEditarEmpleadoComponent {

  readonly estadosCiviles: string[];
  userForm: FormGroup;

  constructor(private fb: FormBuilder,
              private _empleadoService: EmpleadoService
    ) {
    this.estadosCiviles = ESTADOS_CIVILES;
    this.userForm = this.fb.group({
      nombreCompleto: new FormControl('', [Validators.required, Validators.minLength(5)]),
      email: new FormControl('', [Validators.required, Validators.email]),
      fechaIngreso: new FormControl('', [Validators.required]),
      telefono: new FormControl('', [Validators.required, Validators.pattern('^[0-9]*$')]),
      estadoCivil: new FormControl('', [Validators.required]),
      sexo: new FormControl('', [Validators.required]),
    });
  }

  guardarEmpleado() {
    const newEmpleado = Empleado.mapFromObject(this.userForm.value);
    this._empleadoService.agregarEmpleado(newEmpleado)
    .subscribe({
      next: empleado => console.log(empleado)
    });
  }

}

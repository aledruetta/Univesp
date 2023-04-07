import { Component } from '@angular/core';
import { AbstractControl, FormBuilder, FormControl, FormGroup, ValidatorFn, Validators } from '@angular/forms';

@Component({
  selector: 'app-agregar-editar-empleado',
  templateUrl: './agregar-editar-empleado.component.html',
  styleUrls: ['./agregar-editar-empleado.component.css']
})
export class AgregarEditarEmpleadoComponent {

  readonly estadosCiviles: string[];
  userForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.estadosCiviles = ['Soltero', 'Casado', 'Separado', 'Divorciado', 'Viudo'];
    this.userForm = this.fb.group({
      nombreCompleto: new FormControl('', [Validators.required, Validators.minLength(5)]),
      email: new FormControl('', [Validators.required, Validators.email]),
      fechaIngreso: new FormControl('', [Validators.required]),
      telefono: new FormControl('', [Validators.required, Validators.pattern('^[0-9]*$')]),
      estadoCivil: new FormControl('', [Validators.required]),
      sexo: new FormControl('', [Validators.required]),
    });
  }

}

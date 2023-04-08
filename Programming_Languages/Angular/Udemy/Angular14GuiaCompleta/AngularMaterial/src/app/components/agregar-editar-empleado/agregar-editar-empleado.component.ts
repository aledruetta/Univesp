import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ESTADOS_CIVILES, Empleado } from 'src/app/models/empleado.model';
import { EmpleadoService } from 'src/app/services/empleado.service';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MensajeConfirmarComponent } from '../shared/mensaje-confirmar/mensaje-confirmar.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-agregar-editar-empleado',
  templateUrl: './agregar-editar-empleado.component.html',
  styleUrls: ['./agregar-editar-empleado.component.css']
})
export class AgregarEditarEmpleadoComponent {

  readonly estadosCiviles: string[];
  userForm: FormGroup;

  constructor(private fb: FormBuilder,
              private _empleadoService: EmpleadoService,
              private _router: Router,
              public dialog: MatDialog,
              public snackBar: MatSnackBar
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

  cancelarCrearEmpleado() {
    const dialogRef = this.dialog.open(MensajeConfirmarComponent, {
      //width: '250px',
      data: { titulo: 'Cuidado!', mensaje: 'Está seguro que quiere cancelar la creación de empleado/a?'},
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result === 'aceptar') {
        this._router.navigate(['/']);
      }
    });
  }

  guardarEmpleado() {
    if (this.userForm.invalid) {
      return;
    }
    const newEmpleado = Empleado.mapFromObject(this.userForm.value);
    this._empleadoService.agregarEmpleado(newEmpleado)
    .subscribe({
      next: empleado => {
        this._router.navigate(['/']);
      }
    });
  }

}

import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-mensaje-confirmar',
  templateUrl: './mensaje-confirmar.component.html',
  styleUrls: ['./mensaje-confirmar.component.css']
})
export class MensajeConfirmarComponent {

  titulo: string;
  mensaje: string;

  constructor(public dialogRef: MatDialogRef<MensajeConfirmarComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
  ) {
    this.titulo = data.titulo;
    this.mensaje = data.mensaje;
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}

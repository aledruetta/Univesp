import { Component } from '@angular/core';
import { Subscription } from 'rxjs';
import { ImagenService } from 'src/app/services/imagen.service';

@Component({
  selector: 'app-error',
  templateUrl: './error.component.html',
  styleUrls: ['./error.component.css']
})
export class ErrorComponent {

  texto: string;
  mostrar: boolean;
  suscription: Subscription;

  constructor(private _imagenService: ImagenService) {
    this.texto = '';
    this.mostrar = false;
    this.suscription = new Subscription();
   }

  ngOnInit(): void {
    this.suscription = this._imagenService.getError()
      .subscribe({
        next: data => {
          this.mostrarMensaje();
          this.texto = data;
        }
      });
  }

  ngOnDestroy(): void {
    this.suscription.unsubscribe();
  }

  mostrarMensaje() {
    this.mostrar = true;
    setTimeout(() => {
      this.mostrar = false;
    }, 2000);
  }
}

import { Component } from '@angular/core';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent {

  private timeoutHandler: ReturnType<typeof setInterval> | null = null;

  altura: Record<string, number> = {
    valor: 0,
    min: 0,
    max: 230,
  };

  campos: Record<string, number> = {
    edad: 0,
    peso: 0,
  }

  onClick(operacion: string, campo: string) {
    this.aumentarDisminuir(operacion, campo);
  }

  onMousedown(operacion: string, campo: string) {
    this.timeoutHandler = setInterval(() => {
      this.aumentarDisminuir(operacion, campo);
    }, 100);
  }

  onMouseup() {
    if (this.timeoutHandler) {
      clearInterval(this.timeoutHandler);
      this.timeoutHandler = null;
    }
  }

  aumentarDisminuir(operacion: string, campo: string) {
    if (operacion === 'aumentar') {
      this.campos[campo]++;
    }
    else if (operacion === 'disminuir' && this.campos[campo] > 0) {
      this.campos[campo]--;
    }
  }

}

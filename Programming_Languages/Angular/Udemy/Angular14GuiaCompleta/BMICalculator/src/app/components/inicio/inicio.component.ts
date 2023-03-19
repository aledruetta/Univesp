import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {

  private timeoutHandler: ReturnType<typeof setInterval> | null = null;

  altura: Record<string, number> = {
    valor: 150,
    min: 0,
    max: 230,
  };

  campos: Record<string, number> = {
    edad: 25,
    peso: 55,
  }

  sexo: string = '';

  constructor(private router: Router) {
  }

  ngOnInit(): void {
  }

  calcularBMI() {
    const bmi = this.campos['peso'] / Math.pow(this.altura['valor'] / 100, 2);
    this.router.navigate(['/resultado', bmi]);
  }

  selectSexo(sexoSelected: string) {
    this.sexo = sexoSelected.toLowerCase();
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
    if (operacion.toLowerCase() === 'aumentar') {
      this.campos[campo]++;
    }
    else if (operacion.toLowerCase() === 'disminuir' && this.campos[campo] > 0) {
      this.campos[campo]--;
    }
  }

}

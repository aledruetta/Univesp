import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-resultado',
  templateUrl: './resultado.component.html',
  styleUrls: ['./resultado.component.css']
})
export class ResultadoComponent implements OnInit {

  resultado: string;
  bmi: number;
  interpretacion: string;

  constructor(private route: ActivatedRoute) {
    this.resultado = '';
    this.bmi = +route.snapshot.paramMap.get('bmi')!;
    this.interpretacion = '';
  }

  ngOnInit(): void {
    this.calcularResultado();
  }

  calcularResultado() {
    if (this.bmi < 18.5) {
      this.resultado = 'Bajo peso';
      this.interpretacion = 'Hay que comer más y mejor!';
    }
    else if (this.bmi >= 18.5 && this.bmi < 25.0) {
      this.resultado = 'Peso normal';
      this.interpretacion = 'Sigue así, lo estás haciendo bien!';
    }
    else if (this.bmi >= 25.0 && this.bmi < 30.0) {
      this.resultado = 'Sobrepeso';
      this.interpretacion = 'Hay que comer mejor y hacer más ejercicio!';
    }
    else if (this.bmi >= 30.0 && this.bmi < 35.0) {
      this.resultado = 'Obesidad clase I';
      this.interpretacion = 'Hay que comer mejor y hacer más ejercicio!';
    }
    else if (this.bmi >= 35 && this.bmi < 40.0) {
      this.resultado = 'Obesidad clase II';
      this.interpretacion = 'Hay que comer mejor y hacer más ejercicio!';
    }
    else {
      this.resultado = 'Obesidad clase III';
      this.interpretacion = 'Hay que comer mejor y hacer más ejercicio!';
    }
  }

}

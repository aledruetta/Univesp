export class ClimaResults {

  ciudad: string;
  temperatura: number;
  humedad: number;
  clima: string;

  constructor(ciudad?: string, temperatura?: number, humedad?: number, clima?: string) {
    this.ciudad = ciudad ?? '';
    this.temperatura = temperatura ?? 0;
    this.humedad = humedad ?? 0;
    this.clima = clima ?? '';
  }

}

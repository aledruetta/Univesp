export class TarjetaCredito {
  id?: number;
  titular: string;
  numeroTarjeta: string;
  cvv: number;
  fechaExpiracion: string;
  fechaCreacion: Date;
  fechaActualizacion: Date;

  constructor(titular: string, numeroTarjeta: string, cvv: number, fechaExpiracion: string, fechaCreacion: Date, fechaActualizacion: Date) {
    this.titular = titular;
    this.numeroTarjeta = numeroTarjeta;
    this.cvv = cvv;
    this.fechaExpiracion = fechaExpiracion;
    this.fechaCreacion = new Date();
    this.fechaActualizacion = new Date();
  }

}

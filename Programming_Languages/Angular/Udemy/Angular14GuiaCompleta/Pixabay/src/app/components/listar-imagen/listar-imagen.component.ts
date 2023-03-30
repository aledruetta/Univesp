import { Component } from '@angular/core';
import { Subscription } from 'rxjs';
import { ImagenService } from 'src/app/services/imagen.service';

@Component({
  selector: 'app-listar-imagen',
  templateUrl: './listar-imagen.component.html',
  styleUrls: ['./listar-imagen.component.css']
})
export class ListarImagenComponent {

  termino: string;
  suscription: Subscription;
  listImagenes: any[];
  loading: boolean;
  imagensPorPagina: number;
  paginaActual: number;
  calcularTotalPaginas = 0;

  constructor(private _imagenService: ImagenService) {
    this.termino = '';
    this.suscription = new Subscription();
    this.listImagenes = [];
    this.loading = false;
    this.imagensPorPagina = 30;
    this.paginaActual = 1;
    this.calcularTotalPaginas = 0;
  }

  ngOnInit(): void {
    this.suscription = this._imagenService.getTerminoBusqueda()
      .subscribe(data => {
        this.termino = data;
        this.paginaActual = 1;
        this.loading = true;
        this.obtenerImagenes();
      })
  }

  ngOnDestroy(): void {
    this.suscription.unsubscribe();
  }

  obtenerImagenes() {
    this._imagenService.getImagenes(this.termino, this.imagensPorPagina, this.paginaActual)
      .subscribe({
        next: data => {
          this.loading = false;

          console.log(data);
          if(data.hits.length === 0){
            this._imagenService.setError('Opss.. no encontramos ningun resultado');
            return;
          }
          this.calcularTotalPaginas = Math.ceil(data.totalHits / this.imagensPorPagina);

          this.listImagenes = data.hits;
        },
        error: error => {
          this._imagenService.setError('Opss.. ocurrio un error');
          this.loading = false;
        }
      })
  }

  paginaAnterior() {
    this.paginaActual--;
    this.loading = true;
    this.listImagenes = [];
    this.obtenerImagenes();
  }

  paginaPosterior() {
    this.paginaActual++;
    this.loading = true;
    this.listImagenes = [];
    this.obtenerImagenes();
  }

  paginaAnteriorClass() {
    return this.paginaActual === 1 ? false : true;
  }

  paginaPosteriorClass() {
    return this.paginaActual === this.calcularTotalPaginas ? false : true;
  }

}

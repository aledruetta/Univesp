import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.component.html',
  styleUrls: ['./formulario.component.css']
})
export class FormularioComponent {

  @Output() criteriosBusqueda: EventEmitter<Record<string, string>> = new EventEmitter();
  categoriaSeleccionada: string;
  paisSeleccionado: string;

  categorias: Record<string, string>[] = [
    { value: 'general', name: 'General' },
    { value: 'business', name: 'Negocios' },
    { value: 'entertaiment', name: 'Entretenimiento' },
    { value: 'health', name: 'Salud' },
    { value: 'science', name: 'Ciencia' },
    { value: 'sports', name: 'Deportes' },
    { value: 'technology', name: 'Tecnología' }
  ];

  paises: Record<string, string>[] = [
    { value: 'ar', name: 'Argentina' },
    { value: 'co', name: 'Colombia' },
    { value: 'mx', name: 'México' },
    { value: 'br', name: 'Brasil' },
    { value: 'fr', name: 'Francia' },
    { value: 'us', name: 'Estados Unidos' }
  ];

  constructor() {
    this.categoriaSeleccionada = 'general';
    this.paisSeleccionado = 'ar';
  }

  buscarNoticias(): void {
    const CATEGORIA = this.categorias.find(categoria => categoria['value'] === this.categoriaSeleccionada);
    const PAIS = this.paises.find(pais => pais['value'] === this.paisSeleccionado);

    if (!CATEGORIA || !PAIS) {
      return;
    }

    this.criteriosBusqueda.emit({
      categoria: CATEGORIA['name'],
      pais: PAIS['name']
    });
  }

}

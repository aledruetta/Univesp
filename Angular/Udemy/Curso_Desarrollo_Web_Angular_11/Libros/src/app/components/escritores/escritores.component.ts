import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { throttleTime } from 'rxjs';
import { Escritor } from 'src/app/models/escritor.model';
import { Libro } from 'src/app/models/libro.model';
import { EscritoresService } from 'src/app/services/escritores.service';
import { LibrosService } from 'src/app/services/libros.service';

@Component({
  selector: 'app-escritores',
  templateUrl: './escritores.component.html',
  styleUrls: ['./escritores.component.css']
})
export class EscritoresComponent implements OnInit {

  listaEscritores: Escritor[];
  listaLibros: Libro[];
  escritorId: number;
  escritorForm: FormGroup;

  constructor(private escritoresService: EscritoresService, private librosService: LibrosService) {
    this.listaEscritores = new Array<Escritor>();
    this.listaLibros = new Array<Libro>();
    this.escritorId = 0;
    this.escritorForm = new FormGroup({
      nombre: new FormControl(),
      pais: new FormControl()
    });
  }

  async ngOnInit() {
    this.listaEscritores = await this.escritoresService.getAll();
  }

  onSubmit() {
    this.escritoresService.add(this.escritorForm.value);
    this.escritorForm.reset();
  }

  async onClick(escritorId: number) {
    this.listaLibros = await this.librosService.getByAuthor(escritorId);
    this.escritorId = escritorId;
  }
}

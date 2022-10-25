import { Component, Input, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Libro } from 'src/app/models/libro.model';
import { LibrosService } from 'src/app/services/libros.service';

@Component({
  selector: 'app-libros',
  templateUrl: './libros.component.html',
  styleUrls: ['./libros.component.css']
})
export class LibrosComponent implements OnInit {

  @Input() escritorId: number;
  @Input() listaLibros: Libro[];
  libroForm: FormGroup;

  constructor(private librosService: LibrosService) {
    this.listaLibros = new Array<Libro>();
    this.escritorId = 0;
    this.libroForm = new FormGroup({
      titulo: new FormControl(),
      genero: new FormControl()
    });
  }

  ngOnInit(): void {
  }

  async onSubmit() {
    this.librosService.add(this.libroForm.value, this.escritorId);
    this.libroForm.reset();
  }

}

import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Escritor } from 'src/app/models/escritor.model';
import { EscritoresService } from 'src/app/services/escritores.service';

@Component({
  selector: 'app-escritores',
  templateUrl: './escritores.component.html',
  styleUrls: ['./escritores.component.css']
})
export class EscritoresComponent implements OnInit {

  listaEscritores: Escritor[];
  escritor: FormGroup;

  constructor(private escritoresService: EscritoresService) {
    this.listaEscritores = new Array<Escritor>();
    this.escritor = new FormGroup({
      nombre: new FormControl(),
      pais: new FormControl()
    });
  }

  async ngOnInit() {
    this.listaEscritores = await this.escritoresService.getAll();
  }

  onSubmit() {
    this.escritoresService.add(this.escritor.value);
    this.escritor.reset();
  }
}

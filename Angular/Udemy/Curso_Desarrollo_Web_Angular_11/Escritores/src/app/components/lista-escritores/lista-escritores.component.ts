import { Component, OnInit } from '@angular/core';
import { Escritor } from 'src/app/models/escritor.model';
import { EscritoresService } from 'src/app/services/escritores.service';

@Component({
  selector: 'app-lista-escritores',
  templateUrl: './lista-escritores.component.html',
  styleUrls: ['./lista-escritores.component.css']
})
export class ListaEscritoresComponent implements OnInit {

  arrEscritores: Escritor[];
  escritoresPorPais: Escritor[];

  constructor(private escritoresService: EscritoresService) {
    this.arrEscritores = new Array<Escritor>();
    this.escritoresPorPais = new Array<Escritor>();
  }

  //ngOnInit(): void {
  //  this.escritoresService.getAll()
  //  .then(escritores =>
  //    this.arrEscritores = escritores
  //  );
  //}

  async ngOnInit() {
    this.arrEscritores = await this.escritoresService.getAll();
  }

  async onChange($event: any) {
    this.escritoresPorPais = await this.escritoresService.getPorPais($event.target.value);
  }
}

import { Component } from '@angular/core';
import { Person } from 'src/app/person.model';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.component.html',
  styleUrls: ['./formulario.component.css']
})
export class FormularioComponent {

  personName: string = '';
  personLastName: string = '';

  addPerson() {
    this.persons.push(new Person(this.personName, this.personLastName));
  }

}

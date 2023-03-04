import { Component } from '@angular/core';
import { Person } from './person.model';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  btnToggleState: boolean = false;
  btnIsDisabled: string = '';
  twoBindedField: string = '';
  addedField: string = '';
  ngIfMessage1: string = 'Ahora sí se ve!';
  ngIfMessage2: string = 'No se ve el mensaje!';

  persons: Person[] = [
    new Person('Juan', 'Perez'),
    new Person('Laura', 'Juarez')
  ];

  personName: string = '';
  personLastName: string = '';

  onClickToggle(event: Event) {
    this.btnToggleState = !this.btnToggleState;
    this.btnIsDisabled = this.btnToggleState ? 'disabled' : '';
  }

  onClickAdd(event: Event) {
    this.addedField = this.twoBindedField;
  }

  onClickBtnNgIf() {
    this.btnToggleState = !this.btnToggleState;
  }

  addPerson() {
    this.persons.push(new Person(this.personName, this.personLastName));
  }

}

import { Component, OnInit, Output } from '@angular/core';
import { Person } from '../person.model';

@Component({
  selector: 'app-parent',
  templateUrl: './parent.component.html',
  styleUrls: ['./parent.component.css']
})
export class ParentComponent {

  btnToggleState: boolean = false;
  btnIsDisabled: string = '';
  twoBindedField: string = '';
  addedField: string = '';
  ngIfMessage1: string = 'Ahora sí se ve!';
  ngIfMessage2: string = 'No se ve el mensaje!';

  @Output() persons: Person[] = [
    new Person('Juan', 'Perez'),
    new Person('Laura', 'Juarez')
  ];

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

}

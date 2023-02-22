import { Component } from '@angular/core';

@Component({
  selector: 'app-personas',
  templateUrl: './personas.component.html',
  styleUrls: ['./personas.component.css']
})
export class PersonasComponent {
  private disabled: boolean = false;
  private btnMessage: string = 'No se ha agregado ninguna persona';
  private name: string = '';

  getDisabled() {
    return this.disabled;
  }

  getBtnMessage() {
    return this.btnMessage;
  }

  addPerson() {
    this.btnMessage = 'Persona agregada!';
  }

  setName(event: Event) {
    this.name = (<HTMLInputElement>event.target).value;
  }

  getName() {
    return this.name;
  }
}

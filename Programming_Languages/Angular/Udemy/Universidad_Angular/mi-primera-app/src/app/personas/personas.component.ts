import { Component } from '@angular/core';

@Component({
  selector: 'app-personas',
  templateUrl: './personas.component.html',
  styleUrls: ['./personas.component.css']
})
export class PersonasComponent {
  private disabled: boolean = false;
  private btnState: boolean = false;
  private btnTitle: string = 'Before';
  private name: string | null = '';

  lastname = 'Lastname';

  getDisabled() {
    return this.disabled;
  }

  getBtnTitle() {
    return this.btnTitle;
  }

  clickBtn() {
    if (this.btnState === false) {
      this.btnTitle = 'After';
      this.btnState = true;
    }
    else {
      this.btnTitle = 'Before';
      this.btnState = false;
    }
  }

  setName(event: Event) {
    this.name = (<HTMLInputElement>event.target).value;
    //this.name = (event.target as HTMLElement).textContent;
  }

  getName() {
    return this.name;
  }
}

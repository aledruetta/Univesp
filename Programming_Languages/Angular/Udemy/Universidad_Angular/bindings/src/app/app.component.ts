import { Component } from '@angular/core';

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

  onClickToggle(event: Event) {
    this.btnToggleState = !this.btnToggleState;
    this.btnIsDisabled = this.btnToggleState ? 'disabled' : '';
  }

  onClickAdd(event: Event) {
    this.addedField = this.twoBindedField;
  }

}

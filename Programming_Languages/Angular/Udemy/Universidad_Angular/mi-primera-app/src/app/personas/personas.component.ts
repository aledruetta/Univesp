import { Component } from '@angular/core';

@Component({
  selector: 'app-personas',
  templateUrl: './personas.component.html',
  styleUrls: ['./personas.component.css']
})
export class PersonasComponent {
  private disabled: boolean = true;

  getDisabled() {
    return this.disabled;
  }
}

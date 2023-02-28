import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  first: number = 0;
  second: number = 0;
  result: number = 0;

  calcSum() {
    this.result = this.first + this.second;
  }
}

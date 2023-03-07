import { Component, Input, OnInit } from '@angular/core';
import { Person } from 'src/app/person.model';

@Component({
  selector: 'app-persona',
  templateUrl: './persona.component.html',
  styleUrls: ['./persona.component.css']
})
export class PersonaComponent implements OnInit {

  @Input() person: Person;
  @Input() i: number = 0;

  constructor() { }

  ngOnInit(): void {
  }

}

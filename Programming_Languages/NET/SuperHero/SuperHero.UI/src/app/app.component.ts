import { Component, OnInit } from '@angular/core';

import { SuperHero } from './models/super-hero.model';
import { SuperHeroService } from './services/super-hero.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  heroes: SuperHero[];
  title = 'SuperHero.UI';

  constructor(private superHeroService: SuperHeroService) {
    this.heroes = [];
  }

  ngOnInit(): void {
    this.superHeroService.getSuperHeroes().subscribe((data: SuperHero[]) => {
      this.heroes = data;
    });
  }

}

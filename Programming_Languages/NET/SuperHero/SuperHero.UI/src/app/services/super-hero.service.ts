import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { SuperHero } from '../models/super-hero.model';

@Injectable({
  providedIn: 'root'
})
export class SuperHeroService {

  url: string;

  constructor(private http: HttpClient) { 
    this.url = `${environment.apiUrl}/SuperHero`;
  }

  getSuperHeroes(): Observable<SuperHero[]> {
    return this.http.get<SuperHero[]>(`${this.url}`);
  }

}

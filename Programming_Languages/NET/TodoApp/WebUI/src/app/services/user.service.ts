import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { User } from '../models/user.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private readonly API: string;

  constructor(private http: HttpClient) {
    this.API = environment.apiUrl;
  }

  postUser(user: User): Observable<any> {
    return this.http.post(this.API + '/users', user);
  }

  getUsers(): Observable<any> {
    return this.http.get(this.API + '/users');
  }

  getUser(id: number): Observable<any> {
    return this.http.get(this.API + '/users/' + id);
  }
}

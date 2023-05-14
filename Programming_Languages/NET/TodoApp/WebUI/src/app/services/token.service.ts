import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { JwtHelperService } from '@auth0/angular-jwt';

import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TokenService {

  private readonly API: string;

  constructor(private http: HttpClient,
              private jwtHelper: JwtHelperService)
  {
    this.API = environment.apiUrl;
  }

  getNewToken(email: string, password: string): Observable<any> {
    return this.http.post(this.API + '/auth', { 'email': email, 'password': password });
  }

  saveToken(token: string): void {
    localStorage.setItem('jwt', token);
  }

  getToken(): string | null {
    return localStorage.getItem('jwt');
  }

  removeToken(): void {
    localStorage.removeItem('jwt');
  }

  isTokenExpired(): boolean | Promise<boolean> {
    return this.jwtHelper.isTokenExpired(this.getToken())
  }

}

// Called by JwtModule in app.module.ts
// Configure an interceptor to add the token to the request header
export function getJwtConfigs(): any {
  const apiUrl = environment.apiUrl;
  const domain = environment.apiUrl.split('/')[2];
  return {
    tokenGetter: () => localStorage.getItem('jwt'),
    allowedDomains: [domain],
    disallowedRoutes: [apiUrl + '/auth'],
  }
}

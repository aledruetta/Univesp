import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

import { TokenService } from './token.service';
import { UserService } from './user.service';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private tokenService: TokenService,
              private userService: UserService,
              private router: Router) { }

  signUp(user: User): void {
    this.userService.postUser(user)
    .subscribe({
      next: data => {
        console.log(data);
        this.router.navigate(['/auth/signin']);
      },
      error: error => {
        console.error('There was an error!', error);
      }
    });
  }

  signIn(email: string, password: string): void {
    this.tokenService.getNewToken(email, password)
    .subscribe({
      next: data => {
        this.tokenService.saveToken(data.accessToken);
        localStorage.setItem('id', data.userId);
        this.router.navigate(['/todos']);
      },
      error: error => {
        console.error('There was an error!', error);
      }
    });
  }

  signOut(): void {
    this.tokenService.removeToken();
    localStorage.removeItem('id');
    this.router.navigate(['/']);
  }

  isUserAuthenticated(): boolean {
    const jwt = this.tokenService.getToken();
    const userId = localStorage.getItem('id');
    return jwt !== null && userId !== null && !this.tokenService.isTokenExpired();
  }

}

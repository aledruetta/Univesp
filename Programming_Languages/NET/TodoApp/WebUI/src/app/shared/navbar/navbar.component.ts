import { Component } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {

  constructor(private authService: AuthService) { }

  isUserAuthenticated(): boolean {
    return this.authService.isUserAuthenticated();
  }

  signOut(): void {
    this.authService.signOut();
  }

}

import { NgModule, inject } from '@angular/core';
import { CanActivateFn, RouterModule, Routes } from '@angular/router';

import { AuthComponent } from './shared/auth/auth.component';
import { SignInComponent } from './shared/auth/sign-in/sign-in.component';
import { SignUpComponent } from './shared/auth/sign-up/sign-up.component';
import { TodosComponent } from './components/todos/todos.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { AuthService } from './services/auth.service';

const authGuardFn: CanActivateFn = () => {
  const authService = inject(AuthService);
  return authService.isUserAuthenticated();
};

const routes: Routes = [
  { path: '', component: HomePageComponent },
  {
    path: 'auth',
    component: AuthComponent,
    children: [
      { path: 'signin', component: SignInComponent },
      { path: 'signup', component: SignUpComponent },
    ]
  },
  {
    path: 'todos',
    component: TodosComponent,
    canActivate: [authGuardFn]
  },
  { path: '**', redirectTo: '', pathMatch: 'full' },
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

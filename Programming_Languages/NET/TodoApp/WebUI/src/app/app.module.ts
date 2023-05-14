
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { JwtModule } from '@auth0/angular-jwt';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { TodosComponent } from './components/todos/todos.component';
import { HomePageComponent } from './components/home-page/home-page.component';
import { AngularMaterialModule } from './shared/angular-material/angular-material.module';
import { AuthComponent } from './shared/auth/auth.component';
import { NavbarComponent } from './shared/navbar/navbar.component';
import { SignUpComponent } from './shared/auth/sign-up/sign-up.component';
import { SignInComponent } from './shared/auth/sign-in/sign-in.component';
import { getJwtConfigs } from './services/token.service';

@NgModule({
  declarations: [
    AppComponent,
    AuthComponent,
    NavbarComponent,
    SignInComponent,
    SignUpComponent,
    TodosComponent,
    HomePageComponent,
  ],
  imports: [
    AngularMaterialModule,
    AppRoutingModule,
    BrowserModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule,
    RouterModule,
    BrowserAnimationsModule,
    JwtModule.forRoot({
      config: getJwtConfigs(),
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

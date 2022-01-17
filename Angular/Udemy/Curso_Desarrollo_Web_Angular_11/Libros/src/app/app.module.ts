import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { EscritoresComponent } from './components/escritores/escritores.component';
import { ReactiveFormsModule } from '@angular/forms';
import { LibrosComponent } from './components/libros/libros.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    EscritoresComponent,
    LibrosComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

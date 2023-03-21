import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { AgregarCitaComponent } from './components/agregar-cita/agregar-cita.component';
import { ListarCitaComponent } from './components/listar-cita/listar-cita.component';

@NgModule({
  declarations: [
    AppComponent,
    AgregarCitaComponent,
    ListarCitaComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { SaludoComponent } from './saludo/saludo.component';
import { PadreComponent } from './padre/padre.component';
import { Hijo1Component } from './hijo1/hijo1.component';
import { Hijo2Component } from './hijo2/hijo2.component';
import { EventosComponent } from './eventos/eventos.component';
import { SumarComponent } from './sumar/sumar.component';
import { CronometroComponent } from './cronometro/cronometro.component';
import { AlertaComponent } from './alerta/alerta.component';

@NgModule({
  declarations: [
    AppComponent,
    SaludoComponent,
    PadreComponent,
    Hijo1Component,
    Hijo2Component,
    EventosComponent,
    SumarComponent,
    CronometroComponent,
    AlertaComponent
  ],
  imports: [
    BrowserModule,
    FormsModule               // para poder usar ngModel
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

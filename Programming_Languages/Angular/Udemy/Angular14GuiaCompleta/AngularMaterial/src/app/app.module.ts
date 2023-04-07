import { AppRoutingModule } from './app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AngularMaterialModule } from './components/shared/angular-material/angular-material.module';

import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { AgregarEditarEmpleadoComponent } from './components/agregar-editar-empleado/agregar-editar-empleado.component';
import { ListarEmpleadosComponent } from './components/listar-empleados/listar-empleados.component';
import { MensajeConfirmarComponent } from './components/shared/mensaje-confirmar/mensaje-confirmar.component';
import { MAT_DATE_LOCALE } from '@angular/material/core';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    AgregarEditarEmpleadoComponent,
    ListarEmpleadosComponent,
    MensajeConfirmarComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    AngularMaterialModule,
    ReactiveFormsModule,
  ],
  providers: [
    {provide: MAT_DATE_LOCALE, useValue: 'es-AR'},
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

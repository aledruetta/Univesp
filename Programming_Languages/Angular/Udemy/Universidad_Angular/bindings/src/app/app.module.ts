import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { ParentComponent } from './parent/parent.component';
import { PersonaComponent } from './parent/persona/persona.component';
import { FormularioComponent } from './parent/formulario/formulario.component';

@NgModule({
  declarations: [
    AppComponent,
    ParentComponent,
    PersonaComponent,
    FormularioComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

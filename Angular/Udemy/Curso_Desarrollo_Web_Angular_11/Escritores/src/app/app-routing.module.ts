import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListaEscritoresComponent } from './components/lista-escritores/lista-escritores.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: '/escritores' },
  { path: 'escritores', component: ListaEscritoresComponent },
  { path: '**', redirectTo: '/escritores' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

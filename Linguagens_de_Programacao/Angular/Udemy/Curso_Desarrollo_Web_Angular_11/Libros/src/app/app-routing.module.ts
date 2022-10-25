import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EscritoresComponent } from './components/escritores/escritores.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: '/escritores' },
  { path: 'escritores', component: EscritoresComponent },
  { path: '**', redirectTo: '/escritores' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AgregarEditarEmpleadoComponent } from './components/agregar-editar-empleado/agregar-editar-empleado.component';
import { ListarEmpleadosComponent } from './components/listar-empleados/listar-empleados.component';

const routes: Routes = [
  { path: '', component: ListarEmpleadosComponent },
  { path: 'created', component: ListarEmpleadosComponent },
  { path: 'add', component: AgregarEditarEmpleadoComponent },
  { path: 'edit/:id', component: AgregarEditarEmpleadoComponent },
  { path: '**', redirectTo: '', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

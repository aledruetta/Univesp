import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Empleado } from 'src/app/models/empleado.model';
import { EmpleadoService } from 'src/app/services/empleado.service';

@Component({
  selector: 'app-listar-empleados',
  templateUrl: './listar-empleados.component.html',
  styleUrls: ['./listar-empleados.component.css']
})
export class ListarEmpleadosComponent implements OnInit, AfterViewInit {
  displayedColumns: string[];
  dataSource: MatTableDataSource<Empleado>;

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private _servicioEmpleados: EmpleadoService) {
    this.displayedColumns = ['id', 'nombreCompleto', 'telefono', 'correo', 'fechaIngreso', 'sexo', 'estadoCivil', 'acciones'];
    this.dataSource = new MatTableDataSource();
    this.paginator = {} as MatPaginator;
    this.sort = {} as MatSort;
  }

  ngOnInit(): void {
    this.obtenerEmpleados();
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  obtenerEmpleados() {
    this._servicioEmpleados.getEmpleados()
    .subscribe({
      next: (empleados: Empleado[]) => {
        this.dataSource.data = empleados;
      }
    });
  }

  editarEmpleado(id: number) {
    // algo
  }

  eliminarEmpleado(id: number) {
    this._servicioEmpleados.eliminarEmpleado(id).subscribe({
      next: (empleados: Empleado[]) => {
        this.dataSource.data = empleados;
      }
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}

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
  listaEmpleados: Empleado[];

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private _servicioEmpleados: EmpleadoService) {
    this.displayedColumns = ['nombreCompleto', 'telefono', 'correo', 'fechaIngreso', 'sexo', 'estadoCivil', 'acciones'];
    this.dataSource = {} as MatTableDataSource<Empleado>;
    this.listaEmpleados = [];
    this.paginator = {} as MatPaginator;
    this.sort = {} as MatSort;
  }

  ngOnInit(): void {
    this.getEmpleados();
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  getEmpleados() {
    this.listaEmpleados = this._servicioEmpleados.getEmpleados();
    this.dataSource = new MatTableDataSource(this.listaEmpleados);
  }

  editarEmpleado(nombre: string) {
  }

  eliminarEmpleado(nombre: string) {
    this._servicioEmpleados.eliminarEmpleado(nombre);
    this.dataSource.data = this._servicioEmpleados.getEmpleados();
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}

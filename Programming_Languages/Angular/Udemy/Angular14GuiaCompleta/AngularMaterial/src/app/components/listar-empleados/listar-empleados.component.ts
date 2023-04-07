import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Empleado } from 'src/app/models/empleado.model';
import { EmpleadoService } from 'src/app/services/empleado.service';
import { MensajeConfirmarComponent } from '../shared/mensaje-confirmar/mensaje-confirmar.component';
import { MatSnackBar } from '@angular/material/snack-bar';

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

  pageSizeOptions: number[];
  pageSize: number;

  constructor(private _servicioEmpleados: EmpleadoService,
              public dialog: MatDialog,
              public snackBar: MatSnackBar
  ) {
    this.displayedColumns = ['id', 'nombreCompleto', 'telefono', 'correo', 'fechaIngreso', 'sexo', 'estadoCivil', 'acciones'];
    this.dataSource = new MatTableDataSource();
    this.paginator = {} as MatPaginator;
    this.sort = {} as MatSort;
    this.pageSizeOptions = [5, 10, 25];
    this.pageSize = 10;
  }

  ngOnInit(): void {
    this.obtenerEmpleados();
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  obtenerEmpleados(): void {
    this._servicioEmpleados.getEmpleados()
    .subscribe({
      next: (res: Empleado[]) => {
        this.dataSource.data = res;
      }
    });
  }

  editarEmpleado(empleado: Empleado) {
    this._servicioEmpleados.editarEmpleado(empleado)
    .subscribe({
      next: (res: Empleado) => {
        this.obtenerEmpleados();
        console.log('Empleado editado: id ', res.id);
      }
    });
  }

  eliminarEmpleado(id: number) {
    const empleado: string | undefined = this.dataSource.data.find(e => e.id === id)?.nombreCompleto;
    const dialogRef = this.dialog.open(MensajeConfirmarComponent, {
      //width: '250px',
      data: { titulo: 'Cuidado!', mensaje: `Está seguro que quiere eliminar el empleado/a: ${empleado}?`},
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result === 'aceptar') {
        this._servicioEmpleados.eliminarEmpleado(id)
        .subscribe({
          next: (res: Empleado) => {
            console.log('Empleado eliminado: id ', res.id);
            this.snackBar.open('Empleado eliminado', 'Cerrar', {
              duration: 5000,
            });
            this.obtenerEmpleados();
          }
        });
      }
    });
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

}

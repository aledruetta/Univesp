import { Component } from '@angular/core';
import { ClimaResults } from 'src/app/models/climaResults.model';
import { ClimaService } from 'src/app/services/clima.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent {

  results: ClimaResults;
  spinnerEnabled: boolean;
  error: string;

  constructor(private _climaService: ClimaService) {
    this.results = new ClimaResults();
    this.spinnerEnabled = false;
    this.error = '';
  }

  obtenerClima(): void {
    const KELVIN_TO_CELSIUS = 273.15;

    this.spinnerEnabled = true;
    this._climaService.obtenerClima(this.results.ciudad)
      .subscribe(
        { next: data => {
          this.results = new ClimaResults(this.results.ciudad,
                                          data.main.temp - KELVIN_TO_CELSIUS,
                                          data.main.humidity,
                                          data.weather[0].main);
          },
          error: () => {
            this.error = 'No se pudo obtener el clima de la ciudad';
            setTimeout(() => {
              this.results = new ClimaResults();
              this.error = '';
            }, 3000);
          }
        }
      );
    this.spinnerEnabled = false;
  }

}

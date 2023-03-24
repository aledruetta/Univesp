import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ClimaService {

  private _apiurl: string;

  constructor(private _http: HttpClient) {
    const APIKEY = '';
    this._apiurl = 'https://api.openweathermap.org/data/2.5/weather?q={city}&appid={apikey}'.replace('{apikey}', APIKEY);
  }

  obtenerClima(ciudad: string): Observable<any> {
    const URL = this._apiurl.replace('{city}', encodeURI(ciudad));
    return this._http.get(URL);
  }

}

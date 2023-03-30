import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ShortUrlService {

  url: string;

  constructor(private _http: HttpClient) {
    this.url = 'https://api-ssl.bitly.com/v4/shorten';
  }

  shortenUrl(longUrl: string): Observable<unknown> {
    const body = { long_url: longUrl };
    return this._http.post(this.url, body);
  }
}

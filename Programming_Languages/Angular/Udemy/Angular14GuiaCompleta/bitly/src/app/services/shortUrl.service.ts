import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ShortUrlService {

  readonly url: string;

  constructor(private _http: HttpClient) {
    this.url = 'https://api-ssl.bitly.com/v4/shorten';
  }

  // Send (POST) the long url to the API and return the response (Observable)
  shortenUrl(longUrl: string): Observable<unknown> {
    const body = { long_url: longUrl };
    return this._http.post(this.url, body);
  }
}

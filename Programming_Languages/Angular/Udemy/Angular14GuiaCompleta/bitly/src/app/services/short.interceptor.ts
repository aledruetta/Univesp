import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { catchError, Observable } from 'rxjs';

@Injectable()
export class ShortInterceptor implements HttpInterceptor {

  constructor() {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const TOKEN = '';
    request = request.clone({ setHeaders: { Authorization: `Bearer ${TOKEN}` } });
    return next.handle(request).pipe(catchError((err: HttpErrorResponse) => {
      console.log(err);
      throw err;
    }));
  }
}

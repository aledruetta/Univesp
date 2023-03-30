import { Component } from '@angular/core';
import { ShortUrlService } from 'src/app/services/shortUrl.service';

@Component({
  selector: 'app-short-url',
  templateUrl: './short-url.component.html',
  styleUrls: ['./short-url.component.css']
})
export class ShortUrlComponent {

  longUrl: string;
  shortUrl: string;
  spinner: boolean;
  errorMessage: string;

  constructor(private _shortUrlService: ShortUrlService) {
    this.longUrl = '';
    this.shortUrl = '';
    this.spinner = false;
    this.errorMessage = '';
  }

  processUrl() {
    if (this.longUrl.length > 0) {
      this.spinner = true;
      setTimeout(() => {
        this._shortUrlService.shortenUrl(this.longUrl).subscribe({
          next: (res: any) => {
            this.spinner = false;
            this.shortUrl = res.link;
          },
          error: (err: any) => {
            this.showError(err);
          }
        });
      }, 1000);
    }
  }

  showError(err: any) {
    this.spinner = false;
    if (err.error.message === 'INVALID_ARG_LONG_URL') {
      this.errorMessage = 'La URL ingresada es inválida';
    }
    setTimeout(() => {
      this.errorMessage = '';
    }, 4000);
  }

  hasError() {
    return this.errorMessage.length > 0;
  }

  hasShortUrl() {
    return this.shortUrl.length > 0;
  }

}

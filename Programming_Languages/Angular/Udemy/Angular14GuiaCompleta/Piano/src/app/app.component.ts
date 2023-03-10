import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Piano';

  playSong(id: number) {
    const audio = new Audio();
    audio.src = `../assets/sounds/note${id}.wav`;
    audio.load();
    audio.play();
  }
}

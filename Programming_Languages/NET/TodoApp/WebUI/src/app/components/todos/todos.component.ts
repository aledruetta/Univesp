import { Component } from '@angular/core';
import { Todo } from 'src/app/models/todo.model';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-todos',
  templateUrl: './todos.component.html',
  styleUrls: ['./todos.component.css']
})
export class TodosComponent {

  todos: Todo[];

  constructor(private userService: UserService) {
    this.todos = [];
    this.getTodos();
  }

  getTodos(): void {
    const userId = +localStorage.getItem('id')!;

    if (userId) {
      this.userService.getUser(userId).subscribe({
        next: data => {
          this.todos = data.todos;
        },
        error: error => {
          console.error('There was an error!', error);
        }
      });
    }
  }

}

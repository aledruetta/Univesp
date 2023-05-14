import { Component } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';

import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent {

  signUpForm: FormGroup;
  hide: boolean;

  constructor(private fb: FormBuilder,
              private authService: AuthService,
              private router: Router
  ) {
    this.signUpForm = this.fb.group({
      name: new FormControl('', [Validators.required, Validators.minLength(3)]),
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(6)]),
    });
    this.hide = true;
  }

  onSubmit() {
    if (this.signUpForm.invalid) {
      console.log("Invalid form: " + this.signUpForm.value);
      return;
    }
    this.authService.signUp(this.signUpForm.value);
  }

  onCancel() {
    this.signUpForm.reset();
  }

  createUser() {
  }

}

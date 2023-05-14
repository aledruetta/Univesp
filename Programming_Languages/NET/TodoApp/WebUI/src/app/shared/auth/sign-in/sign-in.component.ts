import { Component } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent {

  signInForm: FormGroup;
  hide: boolean;

  constructor(private fb: FormBuilder,
              private authService: AuthService,
  ) {
    this.signInForm = this.fb.group({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(6)]),
    });
    this.hide = true;
  }

  onSubmit(): void {
    if (this.signInForm.invalid) {
      console.log("Invalid form: " + this.signInForm.value);
      return;
    }

    const email = this.signInForm.get('email')?.value;
    const password = this.signInForm.get('password')?.value;

    this.authService.signIn(email, password);
  }

  onCancel(): void {
    this.signInForm.reset();
  }

}

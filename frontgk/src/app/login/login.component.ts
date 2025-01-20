import { Component } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatGridListModule } from '@angular/material/grid-list';

@Component({
  selector: 'app-login',
  imports: [
    ReactiveFormsModule,
    MatCardModule,
    MatSelectModule,
    MatInputModule,
    MatFormFieldModule,
    MatGridListModule
  ],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  loginForm = new FormGroup({
    username : new FormControl<string>('abel',[Validators.required,Validators.nullValidator]),
    password : new FormControl<string>('',Validators.required)
  });
  errorMessage = '';

  constructor(private authService: AuthService, private router: Router) {}

  async login() {
    if(this.loginForm.valid){
      if(this.loginForm.value.username && this.loginForm.value.password){
        const data = await this.authService.login(this.loginForm.value.username, this.loginForm.value.password);
        // console.log(data);
      }
    }
  }
}

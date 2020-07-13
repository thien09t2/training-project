import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { HttpErrorResponse } from '@angular/common/http';
import { LoginService } from 'src/app/Service/login.service';
import { Router } from '@angular/router';
import { AuthToken } from '../model/auth.model';
import { SnackBarService } from '../common/snack-bar/snack-bar.service';
import { messageLoginError, messageServerError } from '../common/constrains';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  private formLogin: FormGroup;
  private authToken: AuthToken;
  private flagRequired = false;

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private loginService: LoginService,
    private snackBar: SnackBarService
  ) {}

  ngOnInit() {

    // ReactiveForm login
    this.formLogin = this.fb.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
    })
  }

  /**
   * Login (Set token)
   * 
   * @param formLogin 
   */
  login(formLogin) {

    // Form validation
    if (formLogin.username === '' || formLogin.password === '') {
      this.flagRequired = true;
      return false;
    }

    // Function login
    this.loginService.login(formLogin['username'], formLogin['password'])
      .subscribe(data => {
        this.authToken = data,
        // Set token
        localStorage.setItem('access_token', this.authToken.access_token),
        localStorage.setItem('refresh_token', this.authToken.refresh_token),

        // Redirect to product url
        this.router.navigateByUrl('/product')
      },
        // Login error
        error => {
          (error instanceof HttpErrorResponse && error.status === 400) ?
            // If wrong username or password
            this.snackBar.getSnackBarFail(messageLoginError) :
            // If server error
            this.snackBar.getSnackBarFail(messageServerError)
        });
  }
}
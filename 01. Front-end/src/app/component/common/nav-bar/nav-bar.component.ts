import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { LoginService } from 'src/app/Service/login.service';

@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit {

  @Output() logoutEvent = new EventEmitter();

  private flagLogin = false;

  constructor(private loginService: LoginService) { }

  ngOnInit() {

    // If logged in
    if (localStorage.getItem('access_token') != null) {
      this.flagLogin = true;
    }
  }

  /**
   * Function logout (remove token)
   */
  logout() {
    this.loginService.logout();
    this.flagLogin = false;
    this.logoutEvent.emit();
  }
}
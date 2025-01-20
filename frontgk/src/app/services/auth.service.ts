import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { BehaviorSubject } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { jwtDecode, JwtPayload } from 'jwt-decode';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = environment.apiUrl;
  private loggedIn = false;

  constructor(private http: HttpClient, private router: Router) {}

  async login(username: string, password: string) {
    try {
      const data = await this.http.post<{ token: string }>(`${this.apiUrl}login/login`, { username, password }).toPromise();
      if (data?.token) {
        this.setToken(data.token);
        this.router.navigate(['/serAgente']);
      }
    } catch (error) {
      this.loggedIn = false;
      console.error('Login error:', error);
    }
  }

  setToken(token: string) {
    localStorage.setItem('token', token);
    this.loggedIn = true;
  }

  getToken(): string | null {
    return localStorage.getItem('token');
  }

  isLoggedIn(): boolean {
    const token = this.getToken();
    if (!token) {
      return false;
    }

    // Opcional: Verifica si el token está vencido
    try {
      const decoded = jwtDecode<JwtPayload>(token);
      if (decoded.exp && Date.now() >= decoded.exp * 1000) {
        this.logout(); // Si está vencido, cierra sesión
        return false;
      }
      return true;
    } catch {
      return false;
    }
  }

  getUserFromToken(): string | null {
    const token = this.getToken();
    if (!token) {
      return null;
    }

    try {
      const decoded = jwtDecode<{ sub: string }>(token); // "sub" es común para el username
      return decoded.sub || null;
    } catch (error) {
      console.error('Error al decodificar el token:', error);
      return null;
    }
  }

  logout() {
    localStorage.removeItem('token');
    this.loggedIn = false;
    this.router.navigate(['/login']);
  }
}
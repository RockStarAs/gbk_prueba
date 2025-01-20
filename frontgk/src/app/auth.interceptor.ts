import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const router = inject(Router); // Inyección de dependencia para el Router
  const token = localStorage.getItem('token');
  // console.log('Interceptor ejecutado');
  // console.log('Token actual:', token);

  // if (token) {
  //   // console.log('Token presente, clonando la solicitud...');
  //   const clonedRequest = req.clone({
  //     setHeaders: {
  //       Authorization: `Bearer ${token}`,
  //     },
  //   });
  //   // console.log('Solicitud clonada:', clonedRequest);
  //   return next(clonedRequest);
  // }

  // // console.log('No se encontró token, pasando solicitud original...');
  // return next(req);

  if (token) {
    const clonedRequest = req.clone({
      setHeaders: {
        Authorization: `Bearer ${token}`,
      },
    });

    return next(clonedRequest).pipe(
      catchError((error: HttpErrorResponse) => {
        // Manejo de errores HTTP
        if (error.status === 401 || error.status === 403) {
          console.error('Sesión expirada o JWT inválido');
          localStorage.removeItem('token'); // Eliminar el token
          router.navigate(['/login']); // Redirigir al usuario al login
        }
        return throwError(() => error); // Propagar el error
      })
    );
  }

  return next(req).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error.status === 401 || error.status === 403) {
        console.error('Sesión expirada o JWT inválido');
        localStorage.removeItem('token');
        router.navigate(['/login']);
      }
      return throwError(() => error);
    })
  );
};
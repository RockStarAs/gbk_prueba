import { ApplicationConfig, importProvidersFrom, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { HTTP_INTERCEPTORS, provideHttpClient, withInterceptors } from '@angular/common/http';
import { authInterceptor } from './auth.interceptor';
import { OnlyNumbersDirective } from './only-numbers.directive';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }), 
    provideRouter(routes), 
    provideHttpClient(
      withInterceptors([authInterceptor])
    ),
    importProvidersFrom(
      OnlyNumbersDirective
    ), provideAnimationsAsync()
    // {provide : HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true}
  ]
};

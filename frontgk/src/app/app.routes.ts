import { Routes } from '@angular/router';
import { AfiliateComponent } from './afiliate/afiliate.component';
import { LoginComponent } from './login/login.component';
import { SeragenteComponent } from './seragente/seragente.component';
import { authGuard } from './auth.guard';
import { MailComponent } from './mail/mail.component';

export const routes: Routes = [
    {
        path : '',
        title : 'Afilarse',
        component : AfiliateComponent
    },
    {
        path : 'mail/:id',
        title : 'Mail',
        component : MailComponent
    },
    {
        path : "login",
        component : LoginComponent
    },
    {
        path : "serAgente",
        component : SeragenteComponent,
        canActivate : [authGuard]
    },
    {
        path : '**',
        redirectTo : 'login'
    }
];

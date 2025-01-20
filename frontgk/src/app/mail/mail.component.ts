import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AfiliadoService } from '../services/afiliado.service';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-mail',
  imports: [],
  templateUrl: './mail.component.html',
  styleUrl: './mail.component.css'
})
export class MailComponent implements OnInit{
  userId! : number;
  afiliado : any;
  ruta = '';
  rutaFinal = 'serAgente'
  constructor(private router : Router,private route: ActivatedRoute,private afiliadoService : AfiliadoService){}

  ngOnInit() {
    // this.ruta = environment.apiUrl + this.rutaFinal;
    this.ruta = this.router.serializeUrl(this.router.createUrlTree([`${this.rutaFinal}`]));

    this.route.params.subscribe(async params => {
      this.userId = params['id']; // Obtener el parámetro 'id'
      try{
        const data = await this.afiliadoService.getAfiliado(this.userId);
        console.log("---",data)
        if(data == null){
          this.userId = 0;
          this.afiliado = null;
          this.router.navigate(['/']);
        }else{
          this.afiliado = data;
        }
      }catch(error){
        this.userId = 0;
        this.afiliado = null;
        this.router.navigate(['/']);
      }
      // getAfiliado
    });
  }

}

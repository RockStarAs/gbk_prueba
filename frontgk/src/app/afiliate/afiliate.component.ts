import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ParametrosService } from '../services/parametros.service';
import { AfiliadoService } from '../services/afiliado.service';
import {MatSelectModule} from '@angular/material/select';
import {MatInputModule} from '@angular/material/input';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatCardModule} from '@angular/material/card';
import {MatGridListModule} from '@angular/material/grid-list';
import { Router } from '@angular/router';

@Component({
  selector: 'app-afiliate',
  imports: [
      ReactiveFormsModule,
      MatCardModule,
      MatSelectModule,
      MatInputModule,
      MatFormFieldModule,
      MatGridListModule
  ],
  templateUrl: './afiliate.component.html',
  styleUrl: './afiliate.component.css'
})
export class AfiliateComponent implements OnInit{
  afiliateForm = new FormGroup({
    nombres : new FormControl<string>('Abel',Validators.required),
    apPaterno : new FormControl<string>('Calderon',Validators.required),
    apMaterno : new FormControl<string>('Penia',Validators.required),
    usernameEmail : new FormControl<string>('rcalderon',Validators.required),
    emailProvider : new FormControl<string>('',Validators.required),
    proveedorEmail : new FormControl<string>('',Validators.required),
    telefono : new FormControl<string>('983350928',Validators.required),
    tieneRuc : new FormControl<number>(0,Validators.required),
    idDepartamento : new FormControl<string>('',Validators.required),
    idProvincia : new FormControl<string>('',Validators.required),
    idDistrito : new FormControl<string>('',Validators.required)
  });

  constructor(
    public parametrosService : ParametrosService,
    public afiliadoService : AfiliadoService,
    private router: Router
  ){

  }

  async ngOnInit() {
    await this.parametrosService.getDepartamentos();
    await this.parametrosService.getEmailProviders();
  }

  //control de datos
  async onChangeDepartment(){
    //en este punto ya esta seleccionado el departamento
    // console.log(this.afiliateForm.value.department);
    //cargar aca las provincias
    if(this.afiliateForm.value.idDepartamento){
      this.afiliateForm.patchValue({
        idProvincia : '',
        idDistrito : '',
      })
      await this.parametrosService.getProvincias(this.afiliateForm.value.idDepartamento);
    }
  }
  
  async onChangeProvince(){
    if(this.afiliateForm.value.idDepartamento && this.afiliateForm.value.idProvincia){
      this.afiliateForm.patchValue({
        idDistrito : '',
      })
      await this.parametrosService.getDistritos(this.afiliateForm.value.idProvincia);
    }
  }

  async handleSubmit(){
    if(this.afiliateForm.valid){
      const data = await this.afiliadoService.addAfiliado(this.afiliateForm.value)
      // console.log("data:: ", data)
      if(data != null){
        this.router.navigate(['/mail', data.id]);
      }else{
        alert("Ocurrió un error!");
      }
    }
  }


  onChangeProvider(event : any){
    // this.afiliateForm.value.proveedorEmail = "";
    this.afiliateForm.patchValue({
      proveedorEmail : '',
    })
    if(this.afiliateForm.value.emailProvider != '6'){
      this.parametrosService.emailProviders.map(e=>{
        if(e.valo == event.value){
          // this.afiliateForm.value.proveedorEmail = e.desc;
          this.afiliateForm.patchValue({
            proveedorEmail : e.desc,
          })
        }
      })
    }
  }

  convertToJson(){
    return JSON.stringify(this.afiliateForm.value,null,5)
  }
}

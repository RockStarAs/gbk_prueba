import { Component, OnInit } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { PreagenteService } from '../preagente.service';
import { ParametrosService } from '../services/parametros.service';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatGridListModule } from '@angular/material/grid-list';
import {MatRadioModule} from '@angular/material/radio';
import {MatCheckboxModule} from '@angular/material/checkbox';
import { AfiliadoService } from '../services/afiliado.service';

@Component({
  selector: 'app-seragente',
  imports: [
    ReactiveFormsModule,
    MatCardModule,
    MatSelectModule,
    MatInputModule,
    MatFormFieldModule,
    MatGridListModule,
    MatRadioModule,
    MatCheckboxModule
  ],
  templateUrl: './seragente.component.html',
  styleUrl: './seragente.component.css'
})
export class SeragenteComponent implements OnInit{
  // idDepartamento = "";
  // idProvincia = "";
  // idDistrito = "";
  serAgenteForm = new FormGroup({
    tipoPersona : new FormControl<string>('1'),
    ruc : new FormControl<string>('',[Validators.maxLength(11),Validators.minLength(11),Validators.required]),
    dniTitular : new FormControl<string>('',[Validators.maxLength(8),Validators.minLength(8)]),
    tipoVia : new FormControl<string>({value: '', disabled : true}),
    rellenarDatos : new FormControl<boolean>(false),
    nombreVia : new FormControl<string>({value: '', disabled : true}),
    numero : new FormControl<string>({value: '', disabled : true}),
    interior : new FormControl<string>({value: '', disabled : true}),
    lote : new FormControl<string>({value: '', disabled : true}),
    manzana : new FormControl<string>({value: '', disabled : true}),
    kilometro : new FormControl<string>({value: '', disabled : true}),
    idDepartamento : new FormControl<string>({value: '', disabled : true}),
    idProvincia : new FormControl<string>({value: '', disabled : true}),
    idDistrito : new FormControl<string>({value: '', disabled : true}),
    razonSocial : new FormControl<string>(''),
    denComercial : new FormControl<string>(''),
    ciiu : new FormControl<string>(''),
    aniosXp : new FormControl<number>(0),
    tipoRegimen : new FormControl<String>(''),
    cargo : new FormControl<String>(''),
    poderesInscritos : new FormControl<String>(''),
    dniEjecutivo : new FormControl<string>('',[Validators.maxLength(8),Validators.minLength(8)]),
  });
  usuario = "";
  consultaSunat = {
    idUsuario : null,
    ruc : null,
    razonSocial : null,
    estadoContribuyente : null,
    tipoVia : null,
    nombreVia : null,
    numero : null,
    interior : null,
    lote : null,
    departamento : null,
    manzana : null,
    kilometro : null,
    ubigeo : null,
    mensaje : null,
  }
  // storedData :any;

  constructor(
    private authService: AuthService, 
    private router: Router, 
    private preAgenteService : PreagenteService,
    public parametrosService : ParametrosService,
    private afiliadoService: AfiliadoService
  ) {};

  async ngOnInit() {
    await this.parametrosService.getDepartamentos();
    await this.parametrosService.getTipoVias();
    let user = this.authService.getUserFromToken();
    if(user != null){
      this.usuario = user
      await this.preAgenteService.obtenerPreagente(user);
      this.loadSaveWork();
      // if()
    }

    // if(this.preAgenteService.preAgente == null){
    //   //quitar la sesion
    //   // this.authService.logout();
    // }

    // console.log(user);
  }
  
  loadSaveWork(){
    // this.preAgenteService.preAgente.
    this.serAgenteForm.patchValue({
      tipoPersona : String(this.preAgenteService.preAgente.tipoPersona),
      ruc : this.preAgenteService.preAgente.ruc,
      dniTitular : (this.preAgenteService.preAgente.tipoPersona == 1) ? String(this.preAgenteService.preAgente.dni_titular).trim() : String(this.preAgenteService.preAgente.dni_rep_legal).trim(),
      tipoVia : this.preAgenteService.preAgente.tipoVia,
      nombreVia : this.preAgenteService.preAgente.nombreVia,
      numero : this.preAgenteService.preAgente.numero,
      interior : this.preAgenteService.preAgente.interior,
      lote : this.preAgenteService.preAgente.lote,
      manzana : this.preAgenteService.preAgente.manzana,
      kilometro : this.preAgenteService.preAgente.kilometro,
      idDepartamento : this.preAgenteService.preAgente.idDepartamento,
      idProvincia : this.preAgenteService.preAgente.idProvincia,
      idDistrito : this.preAgenteService.preAgente.idDistrito,
      razonSocial : this.preAgenteService.preAgente.razon_social,
      denComercial : this.preAgenteService.preAgente.denComercial,
      ciiu : this.preAgenteService.preAgente.ciiu,
      aniosXp : this.preAgenteService.preAgente.aniosXp,
      tipoRegimen : this.preAgenteService.preAgente.tipoRegimen,
      cargo : this.preAgenteService.preAgente.cargo,
      poderesInscritos : this.preAgenteService.preAgente.poderesInscritos,
      dniEjecutivo : this.preAgenteService.preAgente.dniEjecutivo,
      rellenarDatos : this.preAgenteService.preAgente.editedInfo == 1 ? true : false
    });
    this.onChangeRellenarDatos({checked : this.serAgenteForm.value.rellenarDatos});
  }

  async onChangeDepartment(event: any ){
    //en este punto ya esta seleccionado el departamento
    // console.log(this.afiliateForm.value.department);
    //cargar aca las provincias
    // this.serAgenteForm.value.idDepartamento = event.target.value;
    this.serAgenteForm.patchValue({
      idDepartamento : event.value
    });
    console.log(event.value)
    await this.parametrosService.getProvincias(this.serAgenteForm.value.idDepartamento || '');
  }
  
  async onChangeProvince(event : any){
    // this.serAgenteForm.value.idProvincia = event.target.value;
    // console.log(event.target.value)
    this.serAgenteForm.patchValue({
      idProvincia : event.value
    });
    await this.parametrosService.getDistritos(this.serAgenteForm.value.idProvincia || '');
  }
  toJson(){
    return JSON.stringify(this.serAgenteForm.value,null,5);
  }
  onSubmit(){
    if(this.serAgenteForm.valid){
      alert('Tu info se enviará proximamente');
    }
  }

  async onSave(){
    //obtener data relevante del usuario
    // const data = await this.afiliadoService.getAfiliado(this.userId);
    const user = this.authService.getUserFromToken();
    if(user != null){
      const data = await this.afiliadoService.getAfiliadoByUser(user);
      // console.log(data);
      // data.id; //id del usuario
      console.log(data);
      if(this.serAgenteForm.valid){
        const preAgente = await this.preAgenteService.salvarPreAgente(this.serAgenteForm.value,data.id);
        console.log(preAgente);
      }
    }else{
      localStorage.removeItem('token');
      this.router.navigate(['/login']);
    }
  }

  onChangeRellenarDatos(event : any){
    let disablee = !!!event.checked;
    // this.serAgenteForm.get('tipoVia')?.disable(disablee);
    let campos = [
    'nombreVia',
    'numero',
    'interior',
    'tipoVia',
    'lote',
    'manzana',
    'kilometro',
    'idDepartamento',
    'idProvincia',
    'idDistrito'];

    if(disablee){
      campos.forEach(e=>{
        this.serAgenteForm.get(e)?.disable();
      });
    }else{
      campos.forEach(e=>{
        this.serAgenteForm.get(e)?.enable();
      });
    }
  }

  logout(){
    localStorage.removeItem('token');
    this.router.navigate(['/login']);
  }

  async simularSunat(){
    try{
      const user = this.authService.getUserFromToken();
      if(user != null && this.serAgenteForm.value.ruc){
        const afiliado = await this.afiliadoService.getAfiliadoByUser(user);
        const sunat = await this.afiliadoService.simulaSunat(afiliado.id,this.serAgenteForm.value.ruc)
        // console.log(sunat);
        this.consultaSunat = sunat;
        if(this.consultaSunat.mensaje != null){
          alert(this.consultaSunat.mensaje);
        }
      }

    }catch(error){
      console.log("error");
      this.consultaSunat = {
        idUsuario : null,
        ruc : null,
        razonSocial : null,
        estadoContribuyente : null,
        tipoVia : null,
        nombreVia : null,
        numero : null,
        interior : null,
        lote : null,
        departamento : null,
        manzana : null,
        kilometro : null,
        ubigeo : null,
        mensaje : null,
      }
    }
  }
}

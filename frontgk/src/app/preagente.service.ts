import { Injectable } from '@angular/core';
import { environment } from '../environments/environment';
import { HttpClient } from '@angular/common/http';

const initialSTATE = Object.freeze({
  "id": 0,
  "idUser": 0,
  "tipoPersona": 0,
  "ruc": "",
  "dni_titular": "",
  "edited_info" : "0",
  "dni_rep_legal": null,
  "tipoVia": null,
  "nombreVia": null,
  "numero": null,
  "interior": null,
  "lote": null,
  "manzana": null,
  "kilometro": null,
  "idDepartamento": null,
  "idProvincia": null,
  "idDistrito": null,
  "razon_social": "",
  "denComercial": "",
  "ciiu": "",
  "aniosXp": 0,
  "tipoRegimen": "",
  "cargo": "",
  "poderesInscritos": "",
  "dniEjecutivo": ""
});

@Injectable({
  providedIn: 'root'
})
export class PreagenteService {
  private apiUrl = environment.apiUrl;
  public preAgente : Object | any = {
    ...initialSTATE
  };
  
  constructor(private http: HttpClient) { }

  async obtenerPreagente(username: string){
    try{
      const data = await this.http.get(`${this.apiUrl}preagente/find/${username}`).toPromise();
      // console.log(data)
      // if(data != null){
      //   this.preAgente = data;
      // }
      this.preAgente = data;
    }catch(error){
      console.log(error);
      this.preAgente = {...initialSTATE};
    }
  }

  async salvarPreAgente(data : any, idUsuario : number){
    try{
      let bodyForm = { ...data,idUsuario };
      bodyForm['rellenarDatos'] = data.rellenarDatos ? '1' : '0';
      const _data = await this.http.post(`${this.apiUrl}preagente/savework`,bodyForm).toPromise();
      console.log(_data);
    }catch(error){
      console.log(error);
    }
  }
}

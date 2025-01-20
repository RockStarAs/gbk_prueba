import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ParametrosService {
  private apiUrl = environment.apiUrl;
  private endpoint = 'parametros/'

  departamentos : any[] = [];
  provincias : any[] = [];
  distritos : any[] = [];
  emailProviders : any[] = [];
  vias : any[] = [];
  
  constructor(private http: HttpClient) { }

  async getDepartamentos(){
    try {
      const data = await this.http.get<any[]>(`${this.apiUrl}${this.endpoint}departamentos`).toPromise();
      // console.log(data);
      this.departamentos = data || [];
    } catch (error) {
      this.departamentos = [];
    }
    // return this.departamentos;
  }

  async getProvincias(idDepartamento: string){
    try {
      const params = new HttpParams().set('idDepartamento',idDepartamento);

      const data = await this.http.get<any[]>(`${this.apiUrl}${this.endpoint}provincias`,{params}).toPromise();
      // console.log(data);
      this.provincias = data || [];
      this.distritos = [];
    } catch (error) {
      this.provincias = [];
      this.distritos = [];
    }
  }

  async getDistritos(idProvincia : string){
    try {
      const params = new HttpParams().set('idProvincia',idProvincia);

      const data = await this.http.get<any[]>(`${this.apiUrl}${this.endpoint}distritos`,{params}).toPromise();
      // console.log(data);
      this.distritos = data || [];
    } catch (error) {
      this.distritos = [];
    }
  }

  async getEmailProviders(){
    // emailProviders
    try{
      const params = new HttpParams().set('id',1).set('dato',1);
      const data = await this.http.get<any[]>(`${this.apiUrl}${this.endpoint}generico`,{params}).toPromise();
      this.emailProviders = data || [];
    }catch(error){
      this.emailProviders = [];
    }
  }

  async getTipoVias(){
    try{
      const params = new HttpParams().set('id',2).set('dato',1);
      const data = await this.http.get<any[]>(`${this.apiUrl}${this.endpoint}generico`,{params}).toPromise();
      this.vias = data || [];
    }catch(error){
      this.vias = [];
    }
  }
}

import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AfiliadoService {
  private apiUrl = environment.apiUrl;
  private endpoint = 'afiliado/'

  constructor(private http: HttpClient) { }

  async addAfiliado(afiliado: any) :Promise<any>{
    // return this.http.post(this.apiUrl, user);
    try{
      const data = await this.http.post(`${this.apiUrl}${this.endpoint}create`, afiliado).toPromise();
      return data;
    }catch(error){
      return null;
    }
  }

  async getAfiliado(id: number) : Promise<any>{
    try{
      const data = await this.http.get(`${this.apiUrl}${this.endpoint}find/${id}`).toPromise();
      return data;
    }catch(error){
      return null;
    }
  }

  async getAfiliadoByUser(user: string) : Promise<any>{
    try{
      const data = await this.http.get(`${this.apiUrl}${this.endpoint}findu/${user}`).toPromise();
      return data;
    }catch(error){
      return null;
    }
  }

  async simulaSunat(idUser: number, ruc: string) : Promise<any>{
    try{
      let params = {ruc, idUsuario : idUser}
      const data = await this.http.post(`${this.apiUrl}${this.endpoint}simulaSunat`,params).toPromise();
      return data;
    }catch(error){
      return null;
    }
  }
}

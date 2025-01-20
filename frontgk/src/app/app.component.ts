import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ParametrosService } from './services/parametros.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent{
  title = 'frontgk';

  // constructor(public parametrosService : ParametrosService){
  // }

  // async ngOnInit() {
  //   await this.parametrosService.getDepartamentos();
  // }

}

package com.globokas.backprueba.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.globokas.backprueba.model.Departamento;
import com.globokas.backprueba.model.Distrito;
import com.globokas.backprueba.model.Parametro;
import com.globokas.backprueba.model.Provincia;
import com.globokas.backprueba.service.ParamsService;

@RestController
@RequestMapping(path = "/parametros")
public class ParamsController {
    @Autowired
    private ParamsService paramsService;

    @GetMapping("/departamentos")
    public List<Departamento> getDepartamentos(){
        return paramsService.listDepartamentos();
    }

    @GetMapping("/provincias")
    public List<Provincia> getProvincias(@RequestParam String idDepartamento){
        return paramsService.listProvincias(idDepartamento);
    }

    @GetMapping("/distritos")
    public List<Distrito> getDistritos(@RequestParam String idProvincia){
        return paramsService.listDistritos(idProvincia);
    }

    @GetMapping("/generico")
    public List<Parametro> getParametros(@RequestParam Integer id, @RequestParam String dato){
        return paramsService.listParams(id, dato);
    }
}

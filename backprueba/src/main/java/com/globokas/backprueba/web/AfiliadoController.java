package com.globokas.backprueba.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globokas.backprueba.model.Afiliado;
import com.globokas.backprueba.requestEntity.CreateAfiliado;
import com.globokas.backprueba.requestEntity.SimulaSunat;
import com.globokas.backprueba.responseEntity.SunatResponse;
import com.globokas.backprueba.service.AfiliadoService;

@RestController
@RequestMapping(path = "/afiliado")
public class AfiliadoController {
    @Autowired
    private AfiliadoService afiliadoService;

    @PostMapping("/create")
    public Afiliado creatAfiliado(@RequestBody CreateAfiliado requestParams){
        return afiliadoService.save(requestParams);
    }

    @GetMapping("/find/{id}")
    public Afiliado findAfiliado(@PathVariable Integer id ){
        return afiliadoService.getById(id);
    }

    @GetMapping("/findu/{username}")
    public Afiliado findAfiliado(@PathVariable String username ){
        return afiliadoService.findByUsuario(username);
    }

    @PostMapping("/simulaSunat")
    public SunatResponse simularSunat(@RequestBody SimulaSunat params){
        return afiliadoService.simularRespuestaSunat(params.getRuc(),params.getIdUsuario());
    }

}

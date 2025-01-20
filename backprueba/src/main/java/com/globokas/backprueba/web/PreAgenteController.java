package com.globokas.backprueba.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.globokas.backprueba.model.PreAgente;
import com.globokas.backprueba.requestEntity.SaveRucValidation;
import com.globokas.backprueba.service.PreAgenteService;


@RestController
@RequestMapping(path="/preagente")
public class PreAgenteController {
    @Autowired
    private PreAgenteService preAgenteService;

    @GetMapping("/find/{username}")
    public PreAgente buscarAgente(@PathVariable String username){
        return preAgenteService.find(username);
    }

    // @GetMapping("/findPre/{username}")
    // public PreAgente buscarPreAgente(@PathVariable String username){
    //     return preAgenteService.find(username);
    // }

    @PostMapping("/savework")
    public PreAgente salvarInfo(@RequestBody SaveRucValidation info){
        System.out.println("Hola");
        return preAgenteService.saveWork(info);
    }
}

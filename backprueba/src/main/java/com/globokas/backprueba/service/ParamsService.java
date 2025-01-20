package com.globokas.backprueba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globokas.backprueba.model.Departamento;
import com.globokas.backprueba.model.Distrito;
import com.globokas.backprueba.model.Parametro;
import com.globokas.backprueba.model.Provincia;
import com.globokas.backprueba.repository.DepartamentoRepository;
import com.globokas.backprueba.repository.DistritoRepository;
import com.globokas.backprueba.repository.ParametrosRepository;
import com.globokas.backprueba.repository.ProvinciaRepository;

@Service
public class ParamsService {
    @Autowired
    private DepartamentoRepository departamentoRepository;
    @Autowired
    private ProvinciaRepository provinciaRepository;
    @Autowired
    private DistritoRepository distritoRepository;
    @Autowired
    private ParametrosRepository parametrosRepository;

    public List<Departamento> listDepartamentos(){
        return departamentoRepository.findAll();
    }

    public List<Provincia> listProvincias(String idDepartamento){
        return provinciaRepository.findByIdDepartamento(idDepartamento);
    }

    public List<Distrito> listDistritos(String idProvincia){
        return distritoRepository.findByIdProvincia(idProvincia);
    }

    public List<Parametro> listParams(Integer id, String dato){
        return parametrosRepository.findParam(id, dato);
    }
}

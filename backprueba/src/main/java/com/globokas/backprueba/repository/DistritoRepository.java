package com.globokas.backprueba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.globokas.backprueba.model.Distrito;

public interface DistritoRepository extends JpaRepository<Distrito,String>{
    List<Distrito> findByIdProvinciaAndIdDepartamento(String idProvincia, String idDepartamento);
    List<Distrito> findByIdProvincia(String idProvincia);
}

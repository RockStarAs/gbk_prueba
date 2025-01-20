package com.globokas.backprueba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.globokas.backprueba.model.Departamento;

public interface DepartamentoRepository extends JpaRepository<Departamento,String>{
    
}

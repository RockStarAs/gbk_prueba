package com.globokas.backprueba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.globokas.backprueba.model.Provincia;

public interface ProvinciaRepository extends JpaRepository<Provincia,String>{
    // List<Provincia> findByIdDepartamento(String idDepartamento);
    @Query(value = "SELECT * FROM pa_provincia where id_departamento = :idDepartamento;", nativeQuery = true)
    List<Provincia> findByIdDepartamento(@Param("idDepartamento") String idDepartamento);
}

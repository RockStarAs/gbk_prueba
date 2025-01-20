package com.globokas.backprueba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.globokas.backprueba.model.Parametro;

public interface ParametrosRepository extends JpaRepository<Parametro,Integer> {
    //Es una busqueda de parametros distinta
    // Consulta nativa
    @Query(value = "SELECT * FROM pa_params WHERE id = :id AND dato = :dato AND valo <> '0'", nativeQuery = true)
    List<Parametro> findParam(@Param("id") Integer id,@Param("dato") String dato);
}

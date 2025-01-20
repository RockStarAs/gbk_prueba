package com.globokas.backprueba.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.globokas.backprueba.model.PreAgente;

public interface PreAgentesRepository extends JpaRepository<PreAgente,Integer>{
    // PreAgente findByIdUser(Integer id_user);
    @Query(value = "SELECT * FROM preagentes WHERE id_user = :id_user", nativeQuery = true)
    PreAgente findByIdUser(@Param("id_user") Integer id_user);

}

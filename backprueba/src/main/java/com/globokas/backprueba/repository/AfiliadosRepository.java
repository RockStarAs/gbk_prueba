package com.globokas.backprueba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.globokas.backprueba.model.Afiliado;

public interface AfiliadosRepository extends JpaRepository<Afiliado,Integer>{
    boolean existsByUsuario(String usuario);
    Afiliado getByUsuario(String usuario);
    Afiliado findByUsuario(String usuario);
}

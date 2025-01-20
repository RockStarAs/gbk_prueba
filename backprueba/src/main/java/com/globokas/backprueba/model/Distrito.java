package com.globokas.backprueba.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="pa_distrito")
public class Distrito {
    @Id
    private String id;
    private String nombre;
    @Column(name="id_provincia")
    private String idProvincia;
    @Column(name="id_departamento")
    private String idDepartamento;

    public String getId() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }
    public String getIdProvincia() {
        return idProvincia;
    }
    public String getIdDepartamento() {
        return idDepartamento;
    }
}

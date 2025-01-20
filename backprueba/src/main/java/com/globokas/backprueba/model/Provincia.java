package com.globokas.backprueba.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="pa_provincia")
public class Provincia {
    @Id
    private String id;
    private String nombre;
    // private String id_departamento;
    @Column(name="id_departamento")
    private String idDepartamento;

    public String getId() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }
    public String getIdDepartamento() {
        return idDepartamento;
    }
}

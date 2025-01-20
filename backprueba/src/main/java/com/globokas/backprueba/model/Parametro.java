package com.globokas.backprueba.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="pa_params")
public class Parametro {
    @Id
    private Integer ntra;

    private Integer id;

    private String dato;
    private String valo;
    private String desc;

    public Integer getId() {
        return id;
    }
    public String getDato() {
        return dato;
    }
    public String getValo() {
        return valo;
    }
    public String getDesc() {
        return desc;
    }
    public Integer getNtra() {
        return ntra;
    }
}

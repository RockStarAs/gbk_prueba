package com.globokas.backprueba.requestEntity;

import java.io.Serializable;

public class SimulaSunat implements Serializable{
    private String ruc;
    private Integer idUsuario;
    public String getRuc() {
        return ruc;
    }
    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    public Integer getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }
}

package com.globokas.backprueba.requestEntity;

import java.io.Serializable;

public class SaveRucValidation implements Serializable{
    private Integer tipoPersona;
    private Integer idUsuario; //id del usuario
    private String ruc;
    private String dniTitular;
    private Integer tipoVia;
    private String rellenarDatos;
    private String nombreVia;
    private String numero;
    private String interior;
    private String lote;
    private String manzana;
    private String kilometro;
    private String idDepartamento;
    private String idProvincia;
    private String idDistrito;
    private String razonSocial;
    private String denComercial;
    private String ciiu;
    private Integer aniosXp;
    private String tipoRegimen;
    private String cargo;
    private String poderesInscritos;
    private String dniEjecutivo;
    
    public SaveRucValidation() {
        this.tipoPersona = null;
        this.ruc = null;
        this.dniTitular = null;
        this.tipoVia = null;
        this.rellenarDatos = null;
        this.nombreVia = null;
        this.numero = null;
        this.interior = null;
        this.lote = null;
        this.manzana = null;
        this.kilometro = null;
        this.idDepartamento = null;
        this.idProvincia = null;
        this.idDistrito = null;
        this.razonSocial = null;
        this.denComercial = null;
        this.ciiu = null;
        this.aniosXp = null;
        this.tipoRegimen = null;
        this.cargo = null;
        this.poderesInscritos = null;
        this.dniEjecutivo = null;
        this.idUsuario = null;
    }
    public Integer getTipoPersona() {
        return tipoPersona;
    }
    public void setTipoPersona(Integer tipoPersona) {
        this.tipoPersona = tipoPersona;
    }
    public String getRuc() {
        return ruc;
    }
    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    public String getDniTitular() {
        return dniTitular;
    }
    public void setDniTitular(String dniTitular) {
        this.dniTitular = dniTitular;
    }
    public Integer getTipoVia() {
        return tipoVia;
    }
    public void setTipoVia(Integer tipoVia) {
        this.tipoVia = tipoVia;
    }
    public String getRellenarDatos() {
        return rellenarDatos;
    }
    public void setRellenarDatos(String rellenarDatos) {
        this.rellenarDatos = rellenarDatos;
    }
    public String getNombreVia() {
        return nombreVia;
    }
    public void setNombreVia(String nombreVia) {
        this.nombreVia = nombreVia;
    }
    public String getNumero() {
        return numero;
    }
    public void setNumero(String numero) {
        this.numero = numero;
    }
    public String getInterior() {
        return interior;
    }
    public void setInterior(String interior) {
        this.interior = interior;
    }
    public String getLote() {
        return lote;
    }
    public void setLote(String lote) {
        this.lote = lote;
    }
    public String getManzana() {
        return manzana;
    }
    public void setManzana(String manzana) {
        this.manzana = manzana;
    }
    public String getKilometro() {
        return kilometro;
    }
    public void setKilometro(String kilometro) {
        this.kilometro = kilometro;
    }
    public String getIdDepartamento() {
        return idDepartamento;
    }
    public void setIdDepartamento(String idDepartamento) {
        this.idDepartamento = idDepartamento;
    }
    public String getIdProvincia() {
        return idProvincia;
    }
    public void setIdProvincia(String idProvincia) {
        this.idProvincia = idProvincia;
    }
    public String getIdDistrito() {
        return idDistrito;
    }
    public void setIdDistrito(String idDistrito) {
        this.idDistrito = idDistrito;
    }
    public String getRazonSocial() {
        return razonSocial;
    }
    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }
    public String getDenComercial() {
        return denComercial;
    }
    public void setDenComercial(String denComercial) {
        this.denComercial = denComercial;
    }
    public String getCiiu() {
        return ciiu;
    }
    public void setCiiu(String ciiu) {
        this.ciiu = ciiu;
    }
    public Integer getAniosXp() {
        return aniosXp;
    }
    public void setAniosXp(Integer aniosXp) {
        this.aniosXp = aniosXp;
    }
    public String getTipoRegimen() {
        return tipoRegimen;
    }
    public void setTipoRegimen(String tipoRegimen) {
        this.tipoRegimen = tipoRegimen;
    }
    public String getCargo() {
        return cargo;
    }
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    public String getPoderesInscritos() {
        return poderesInscritos;
    }
    public void setPoderesInscritos(String poderesInscritos) {
        this.poderesInscritos = poderesInscritos;
    }
    public String getDniEjecutivo() {
        return dniEjecutivo;
    }
    public void setDniEjecutivo(String dniEjecutivo) {
        this.dniEjecutivo = dniEjecutivo;
    }
    public Integer getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(Integer idUser) {
        this.idUsuario = idUser;
    }    
}

package com.globokas.backprueba.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="preagentes")
public class PreAgente {
    // id INT AUTO_INCREMENT PRIMARY KEY,
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name="id_user")
    private Integer idUser;
    @Column(name="tipo_persona")
    private Integer tipoPersona;
    private String ruc;
    private String dni_titular;
    private String dni_rep_legal;
    @Column(name="tipo_via")
    private Integer tipoVia;
    @Column(name="nombre_via")
    private String nombreVia;
    private String numero;
    private String interior;
    private String lote;
    private String manzana;
    private String kilometro;
    @Column(name="id_departamento")
    private String idDepartamento;
    @Column(name="id_provincia")
    private String idProvincia;
    @Column(name="id_distrito")
    private String idDistrito;
    private String razon_social;
    @Column(name="denominacion_comercial")
    private String denComercial;
    private String ciiu;
    @Column(name = "anios_exp")
    private Integer aniosXp;
    @Column(name="tipo_reg")
    private String tipoRegimen;
    private String cargo;
    @Column(name="poderes_ins")
    private String poderesInscritos;
    @Column(name="dni_afiliado")
    private String dniEjecutivo;
    @Column(name="edited_info")
    private Integer editedInfo;
    // dni_afiliado CHAR(8)
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getRuc() {
        return ruc;
    }
    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    public String getDni_titular() {
        return dni_titular;
    }
    public void setDni_titular(String dni_titular) {
        this.dni_titular = dni_titular;
    }
    public String getDni_rep_legal() {
        return dni_rep_legal;
    }
    public void setDni_rep_legal(String dni_rep_legal) {
        this.dni_rep_legal = dni_rep_legal;
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
    public String getRazon_social() {
        return razon_social;
    }
    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }
    public String getCiiu() {
        return ciiu;
    }
    public void setCiiu(String ciiu) {
        this.ciiu = ciiu;
    }
    public String getCargo() {
        return cargo;
    }
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }
    public Integer getIdUser() {
        return idUser;
    }
    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }
    public Integer getTipoPersona() {
        return tipoPersona;
    }
    public void setTipoPersona(Integer tipoPersona) {
        this.tipoPersona = tipoPersona;
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
    public Integer getTipoVia() {
        return tipoVia;
    }
    public void setTipoVia(Integer tipoVia) {
        this.tipoVia = tipoVia;
    }
    public String getNombreVia() {
        return nombreVia;
    }
    public void setNombreVia(String nombreVia) {
        this.nombreVia = nombreVia;
    }
    public String getDenComercial() {
        return denComercial;
    }
    public void setDenComercial(String denComercial) {
        this.denComercial = denComercial;
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
    public String getNumero() {
        return numero;
    }
    public void setNumero(String numero) {
        this.numero = numero;
    }
    public Integer getEditedInfo() {
        return editedInfo;
    }
    public void setEditedInfo(Integer editedInfo) {
        this.editedInfo = editedInfo;
    }    
}

package com.globokas.backprueba.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "afiliados")
public class Afiliado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nombres;
    @Column(name="ap_paterno")
    private String apPaterno;
    @Column(name="ap_materno")
    private String apMaterno;
    @Column(name="username_email")
    private String usernameEmail;
    @Column(name="proveedor_email")
    private String proveedorEmail;
    private String telefono;
    @Column(name="tiene_ruc")
    private Integer tieneRuc;
    @Column(name="id_departamento")
    private String idDepartamento;
    @Column(name="id_provincia")
    private String idProvincia;
    @Column(name="id_distrito")
    private String idDistrito;
    @Column(name="email_enviado")
    private Integer emailEnviado;
    private String usuario;
    private String password;
    
    private Integer intentosDiarios;

    @Column(name = "primer_intento_ts", columnDefinition = "TIMESTAMP")
    private LocalDateTime primerIntentoTs;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNombres() {
        return nombres;
    }
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApPaterno() {
        return apPaterno;
    }
    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }
    public String getApMaterno() {
        return apMaterno;
    }
    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }
    public String getUsernameEmail() {
        return usernameEmail;
    }
    public void setUsernameEmail(String usernameEmail) {
        this.usernameEmail = usernameEmail;
    }
    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public Integer getTieneRuc() {
        return tieneRuc;
    }
    public void setTieneRuc(Integer tieneRuc) {
        this.tieneRuc = tieneRuc;
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
    public Integer getEmailEnviado() {
        return emailEnviado;
    }
    public void setEmailEnviado(Integer emailEnviado) {
        this.emailEnviado = emailEnviado;
    }
    public String getUsuario() {
        return usuario;
    }
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getProveedorEmail() {
        return proveedorEmail;
    }
    public void setProveedorEmail(String proveedorEmail) {
        this.proveedorEmail = proveedorEmail;
    }
    public Integer getIntentosDiarios() {
        return intentosDiarios;
    }
    public void setIntentosDiarios(Integer intentosDiarios) {
        this.intentosDiarios = intentosDiarios;
    }
    public LocalDateTime getPrimerIntentoTs() {
        return primerIntentoTs;
    }
    public void setPrimerIntentoTs(LocalDateTime primerIntentoTs) {
        this.primerIntentoTs = primerIntentoTs;
    }
    
}

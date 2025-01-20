package com.globokas.backprueba.requestEntity;

import java.io.Serializable;

public class CreateAfiliado implements Serializable{
    private Integer id;
    private String nombres;
    private String apPaterno;
    private String apMaterno;
    private String usernameEmail;
    private String telefono;
    private Integer tieneRuc;
    private String idDepartamento;
    private String idProvincia;
    private String idDistrito;
    private String proveedorEmail;
    // name
    // dadLastName
    // momLastName
    // userName
    // emailProvider
    // provider
    // phoneNumber
    // userHasRuc
    // department
    // province
    // district
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
    public String getProveedorEmail() {
        return proveedorEmail;
    }
    public void setProveedorEmail(String proveedorEmail) {
        this.proveedorEmail = proveedorEmail;
    }
}

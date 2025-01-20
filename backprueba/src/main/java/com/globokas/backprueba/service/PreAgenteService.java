package com.globokas.backprueba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globokas.backprueba.model.Afiliado;
import com.globokas.backprueba.model.PreAgente;
import com.globokas.backprueba.repository.AfiliadosRepository;
import com.globokas.backprueba.repository.PreAgentesRepository;
import com.globokas.backprueba.requestEntity.SaveRucValidation;

@Service
public class PreAgenteService {
    @Autowired
    private PreAgentesRepository preAgentesRepository;
    @Autowired
    private AfiliadosRepository afiliadosRepository;

    public PreAgente find(String userName){
        Afiliado af = afiliadosRepository.getByUsuario(userName);
        PreAgente preagente= null;
        if(af != null){
            // System.out.println("no es nulo");
            System.out.println("encontrado!!!");
            preagente = preAgentesRepository.findByIdUser(af.getId());
            System.out.println("preagente: " + preagente);
            //no existe retornará null, se tendrá que crear
            return preagente;
        }
        return preagente;
    }

    public PreAgente saveWork(SaveRucValidation data){
        PreAgente preagente = preAgentesRepository.findByIdUser(data.getIdUsuario());
        System.out.println("llegue");
        if(preagente == null){
            preagente = new PreAgente();
        }
        preagente.setTipoPersona(data.getTipoPersona());
        preagente.setIdUser(data.getIdUsuario());
        preagente.setRuc(data.getRuc());
        if(preagente.getTipoPersona() == 1){
            preagente.setDni_titular(data.getDniTitular());
        }else{
            preagente.setDni_rep_legal(data.getDniTitular());
        }
        preagente.setTipoVia(data.getTipoVia());
        preagente.setNombreVia(data.getNombreVia());
        preagente.setNumero(data.getNumero());
        preagente.setInterior(data.getInterior());
        preagente.setLote(data.getLote());
        preagente.setManzana(data.getManzana());
        preagente.setKilometro(data.getKilometro());
        preagente.setIdDepartamento(data.getIdDepartamento());
        preagente.setIdProvincia(data.getIdProvincia());
        preagente.setIdDistrito(data.getIdDistrito());
        preagente.setRazon_social(data.getRazonSocial());
        preagente.setDenComercial(data.getDenComercial());
        preagente.setCiiu(data.getCiiu());
        preagente.setAniosXp(data.getAniosXp());
        preagente.setTipoRegimen(data.getTipoRegimen());
        preagente.setCargo(data.getCargo());
        preagente.setPoderesInscritos(data.getPoderesInscritos());
        preagente.setDniEjecutivo(data.getDniEjecutivo());
        preagente.setEditedInfo(data.getRellenarDatos().equals("1") ?  1 : 0);

        
        preAgentesRepository.save(preagente);
        return preagente;
       
    }
}
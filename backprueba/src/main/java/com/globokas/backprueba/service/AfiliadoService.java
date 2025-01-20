package com.globokas.backprueba.service;

import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globokas.backprueba.model.Afiliado;
import com.globokas.backprueba.repository.AfiliadosRepository;
import com.globokas.backprueba.requestEntity.CreateAfiliado;
import com.globokas.backprueba.responseEntity.SunatResponse;

@Service
public class AfiliadoService {
    @Autowired
    private AfiliadosRepository afiliadosRepository;

    public Afiliado getById(Integer id){
        return this.afiliadosRepository.findById(id).orElse(null);
    }

    // public Afiliado getByUsuario(String usuario){
    //     return this.afiliadosRepository.findByUs(id).orElse(null);
    // }
    public Afiliado findByUsuario(String usuario){
        Afiliado af = this.afiliadosRepository.findByUsuario(usuario);
        af.setPassword(null);
        return af;
    }

    public Afiliado save(CreateAfiliado afiliado){
        Afiliado af = new Afiliado();
        af.setNombres(afiliado.getNombres());
        af.setApPaterno(afiliado.getApPaterno());
        af.setApMaterno(afiliado.getApMaterno());
        af.setUsernameEmail(afiliado.getUsernameEmail());
        af.setProveedorEmail(afiliado.getProveedorEmail());
        af.setTelefono(afiliado.getTelefono());
        af.setTieneRuc(afiliado.getTieneRuc());
        af.setIdDepartamento(afiliado.getIdDepartamento());
        af.setIdProvincia(afiliado.getIdProvincia());
        af.setIdDistrito(afiliado.getIdDistrito());
        //Crear el usuario y contraseña
        String baseUserName = afiliado.getNombres().trim().toLowerCase().replaceAll("[^a-z0-9]", "");
        String username = baseUserName;
        int suffix = 1;
        
        while(afiliadosRepository.existsByUsuario(username)){
            username = baseUserName + suffix;
            suffix++;
        }

        String password = generatePassword(10);

        System.out.println("usuario: " + username);
        System.out.println("paswsword: " + password);

        af.setUsuario(username);
        af.setPassword(password);
        af.setEmailEnviado(1);
        af.setIntentosDiarios(0);
        af.setPrimerIntentoTs(null);
        
        afiliadosRepository.save(af);
        return af;
        //generar contraseña
        // af.setEmailEnviado();
        // af.setUsuario();
        // af.setPassword();
    }

    private String generatePassword(int tamanio){
        final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$%";
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < tamanio; i++) {
            int index = random.nextInt(CHARACTERS.length());
            password.append(CHARACTERS.charAt(index));
        }
        return password.toString();
    }

    public SunatResponse simularRespuestaSunat(String ruc, Integer idUsuario){
        Afiliado af = getById(idUsuario);
        if(af == null){
            return null;
        }else{
            //obtener dat
            boolean flag = false;
            LocalDateTime now = LocalDateTime.now();
            LocalDateTime fecha = af.getPrimerIntentoTs();
            SunatResponse sunat = new SunatResponse();
            if(fecha != null){
                long daysBetween = ChronoUnit.DAYS.between(fecha, now);
                Integer intentos = af.getIntentosDiarios();
                if(intentos >= 3){
                    if (daysBetween > 1) {
                        af.setIntentosDiarios(1);
                        flag = true;
                    } else {
                        sunat.setMensaje("Usted ha superado los 3 intentos diarios, espere un día para volver a procesar.");
                    }
                    return sunat;
                }else{
                    af.setIntentosDiarios((intentos + 1));
                    flag = true;
                }
            }else{
                flag = true;
                af.setIntentosDiarios(1);
                af.setPrimerIntentoTs(LocalDateTime.now());
            }

            if(flag){
                afiliadosRepository.save(af); //acutalizar
                sunat.setIdUsuario(idUsuario);
                sunat.setRuc(ruc);
                sunat.setRazonSocial("POLLERIA EL POLLITO");
                sunat.setEstadoContribuyente("HABIDO");
                sunat.setTipoVia(2);
                sunat.setNombreVia("SIEMPREVIVA");
                sunat.setNumero("7278");
                sunat.setInterior("1");
                sunat.setLote("Lt. 1");
                sunat.setDepartamento("2");
                sunat.setManzana("Mz. 2");
                sunat.setKilometro("Km 40");
                sunat.setUbigeo("1234");
                // sunat.setMensaje();
            }

            return sunat;
            
            // if (daysBetween > 1) {
            //     System.out.println("Ha pasado más de un día.");
            // } else {
            //     System.out.println("No ha pasado más de un día.");
            // }
            // af.setIntentosDiarios(idUsuario);
        }
    }
}

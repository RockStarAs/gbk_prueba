package com.globokas.backprueba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.globokas.backprueba.model.Afiliado;
import com.globokas.backprueba.repository.AfiliadosRepository;

@Service
public class CustomUserDetailService implements UserDetailsService{
    @Autowired
    private AfiliadosRepository afiliadosRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // System.out.println("pasando");
        Afiliado afiliado = afiliadosRepository.getByUsuario(username);
        if(afiliado == null){
            // System.out.println("nulo");
        }else{
            System.out.println(afiliado.getPassword());
            System.out.println(afiliado.getUsuario());
        }
        // System.out.println(afiliado.toString());
        if(afiliado == null){
            // System.out.println("usuario no encontrado");
            throw new UsernameNotFoundException("Usuario no encontrado: " + username);
        }else{
            // System.out.println("no es nulo");
        }

        // return new org.springframework.security.core.userdetails.User(
        //         afiliado.getUsuario(),
        //         afiliado.getPassword(),
        //         "ADMIN"
        //         // afiliado.getRoles() // Roles o authorities del usuario
        // );
        return org.springframework.security.core.userdetails.User.builder()
            .username(afiliado.getUsuario())
            .password(afiliado.getPassword())
            .build();
            // .roles(null)
    }
    
}

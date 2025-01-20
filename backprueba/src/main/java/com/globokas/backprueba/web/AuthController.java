package com.globokas.backprueba.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globokas.backprueba.requestEntity.LoginRequest;
import com.globokas.backprueba.responseEntity.AuthResponse;
import com.globokas.backprueba.service.CustomUserDetailService;
import com.globokas.backprueba.util.JwtUtil;

@RestController
@RequestMapping(path = "/login")
public class AuthController {
    private final JwtUtil jwtUtil;
    private final CustomUserDetailService userDetailsService;

    public AuthController(JwtUtil jwtUtil,CustomUserDetailService userDetailsService) {
        this.jwtUtil = jwtUtil;
        this.userDetailsService = userDetailsService;
    }

    // @PostMapping
    // public ResponseEntity<?> login(@RequestBody LoginRequest request) {
    //     if ("user".equals(request.getUsername()) && "password".equals(request.getPassword())) {
    //         String token = JwtUtil.generateToken(request.getUsername());
    //         return ResponseEntity.ok(new AuthResponse(token));
    //     } else {
    //         return ResponseEntity.status(401).body("Credenciales inválidas");
    //     }
    // }
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest authRequest) {
        // Aquí puedes validar credenciales de usuario
        // System.out.println(authRequest.getUsername());
        // System.out.println(authRequest.getPassword());

        // if ("user".equals(authRequest.getUsername()) && "password".equals(authRequest.getPassword())) {
            // }
        try{
            var userDetails = userDetailsService.loadUserByUsername(authRequest.getUsername());

            // Validar contraseña
            System.out.println("salida: " + authRequest.getPassword());
            System.out.println("llegada: " + userDetails.getPassword());
            if (!authRequest.getPassword().equals(userDetails.getPassword())) {
                return ResponseEntity.status(401).body("Credenciales inválidas");
            }
            String token = jwtUtil.generateToken(authRequest.getUsername());
            return ResponseEntity.ok(new AuthResponse(token));
        }catch(Exception e){
            System.out.println(e.getMessage());
            return ResponseEntity.status(401).body("Credenciales inválidas");
        }
    }
}

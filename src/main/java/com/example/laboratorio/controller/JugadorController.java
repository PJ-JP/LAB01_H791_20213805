package com.example.laboratorio.controller;


import com.example.laboratorio.entity.Jugador;
import com.example.laboratorio.repository.JugadorRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/player")
public class JugadorController {
    final JugadorRepository jugadorRepository;
    public JugadorController(JugadorRepository jugadorRepository) {
        this.jugadorRepository = jugadorRepository;
    }

    @GetMapping("/list")
    public String listarJugadores(Model model) {
        List<Jugador> jugadorList = jugadorRepository.findAll();
        model.addAttribute("listaJugadores",jugadorList);
        return "jugadores/listaJugadores";
    }

}

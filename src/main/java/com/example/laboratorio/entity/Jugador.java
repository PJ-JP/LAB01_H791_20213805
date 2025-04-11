package com.example.laboratorio.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "jugador")
public class Jugador {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idjugador", nullable = false)
    private Integer idjugador;

    @Column(name = "nombre", nullable = false)
    private String nombre;

    @Column(name = "edad", nullable = false)
    private Integer edad;

    @Column(name = "posicion", nullable = false)
    private String posicion;

    @Column(name = "club", nullable = false)
    private String club;

    @Column(name = "seleccion", nullable = false)
    private Integer seleccion;


}

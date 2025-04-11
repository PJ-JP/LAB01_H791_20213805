package com.example.laboratorio.repository;


import com.example.laboratorio.entity.Jugador;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JugadorRepository extends JpaRepository<Jugador,Integer> {

}

/*
public interface EmployeeRepository extends JpaRepository<Employee,Integer> {
    List<Employee> findByCompanyName(String nombre);

    @Query(value = "select * from shippers where CompanyName = ?1",
            nativeQuery = true)
    List<Employee> buscarTransPorCompName(String nombre);
}*/
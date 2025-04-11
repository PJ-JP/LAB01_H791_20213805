package com.example.laboratorio.repository;

import com.example.laboratorio.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee,Integer> {
    List<Employee> findByCompanyName(String nombre);

    @Query(value = "select * from shippers where CompanyName = ?1",
            nativeQuery = true)
    List<Employee> buscarTransPorCompName(String nombre);
}
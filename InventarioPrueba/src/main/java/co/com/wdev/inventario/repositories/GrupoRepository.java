package co.com.wdev.inventario.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.com.wdev.inventario.models.Grupo;

@Repository
public interface GrupoRepository extends JpaRepository<Grupo, Long>{
    
}

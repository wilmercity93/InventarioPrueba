package co.com.wdev.inventario.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.com.wdev.inventario.models.Tipo;

@Repository
public interface TipoRepository extends JpaRepository<Tipo, Long>{
    
}

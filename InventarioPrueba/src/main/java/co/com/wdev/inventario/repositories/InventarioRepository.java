package co.com.wdev.inventario.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.com.wdev.inventario.models.Inventario;

@Repository
public interface InventarioRepository extends JpaRepository<Inventario, Long>{
    
}

package co.com.wdev.inventario.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.com.wdev.inventario.models.Dispositivo;

@Repository
public interface DispositivoRepository extends JpaRepository<Dispositivo, Long>{
    
}

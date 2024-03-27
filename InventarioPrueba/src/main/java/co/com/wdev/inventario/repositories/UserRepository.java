package co.com.wdev.inventario.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import co.com.wdev.inventario.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
    
}

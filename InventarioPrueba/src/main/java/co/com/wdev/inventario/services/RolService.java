package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.RolInterface;
import co.com.wdev.inventario.models.Rol;
import co.com.wdev.inventario.repositories.RolRepository;

@Service
public class RolService implements RolInterface{
    
    @Autowired
    public RolRepository rolRepo;
    
    @Override
    public List<Rol> getRol() {
        return rolRepo.findAll();
    }

    @Override
    public void saveRol(Rol rol) {
        rolRepo.save(rol) ;
    }

    @Override
    public void deleteRol(Long id) {
        rolRepo.deleteById(id);
    }

    @Override
    public Rol findRol(Long id) {
    	Rol rol = rolRepo.findById(id).orElse(null);
        return rol;
    }    
}

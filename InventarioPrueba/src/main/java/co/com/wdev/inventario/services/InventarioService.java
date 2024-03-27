package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.InventarioInterface;
import co.com.wdev.inventario.models.Inventario;
import co.com.wdev.inventario.repositories.InventarioRepository;

@Service
public class InventarioService implements InventarioInterface{

	@Autowired
    public InventarioRepository inventarioRepo;
    
    @Override
    public List<Inventario> getInventario() {
        return inventarioRepo.findAll();
    }

    @Override
    public void saveInventario(Inventario inventario) {
        inventarioRepo.save(inventario) ;
    }

    @Override
    public void deleteInventario(Long id) {
        inventarioRepo.deleteById(id);
    }

    @Override
    public Inventario findInventario(Long id) {
    	Inventario inventario = inventarioRepo.findById(id).orElse(null);
        return inventario;
    }  
}

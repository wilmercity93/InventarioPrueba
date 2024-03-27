package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.FabricanteInterface;
import co.com.wdev.inventario.models.Fabricante;
import co.com.wdev.inventario.repositories.FabricanteRepository;

@Service
public class FabricanteService implements FabricanteInterface{
    
    @Autowired
    public FabricanteRepository fabricanteRepo;
    
    @Override
    public List<Fabricante> getFabricante() {
        return fabricanteRepo.findAll();
    }

    @Override
    public void saveFabricante(Fabricante fabricante) {
        fabricanteRepo.save(fabricante) ;
    }

    @Override
    public void deleteFabricante(Long id) {
        fabricanteRepo.deleteById(id);
    }

    @Override
    public Fabricante findFabricante(Long id) {
        Fabricante exper = fabricanteRepo.findById(id).orElse(null);
        return exper;
    } 
    
}

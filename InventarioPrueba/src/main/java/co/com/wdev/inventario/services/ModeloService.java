package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.ModeloInterface;
import co.com.wdev.inventario.models.Modelo;
import co.com.wdev.inventario.repositories.ModeloRepository;

@Service
public class ModeloService implements ModeloInterface{
    
    @Autowired
    public ModeloRepository modeloRepo;
    
    @Override
    public List<Modelo> getModelo() {
        return modeloRepo.findAll();
    }

    @Override
    public void saveModelo(Modelo modelo) {
        modeloRepo.save(modelo) ;
    }

    @Override
    public void deleteModelo(Long id) {
        modeloRepo.deleteById(id);
    }

    @Override
    public Modelo findModelo(Long id) {
        Modelo modelo = modeloRepo.findById(id).orElse(null);
        return modelo;
    }    
}

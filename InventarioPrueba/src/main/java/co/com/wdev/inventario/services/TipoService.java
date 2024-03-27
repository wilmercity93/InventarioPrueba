package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.TipoInterface;
import co.com.wdev.inventario.models.Tipo;
import co.com.wdev.inventario.repositories.TipoRepository;

@Service
public class TipoService implements TipoInterface{
    
    @Autowired
    public TipoRepository tipoRepo;
    
    @Override
    public List<Tipo> getTipo() {
        return tipoRepo.findAll();
    }

    @Override
    public void saveTipo(Tipo tipo) {
        tipoRepo.save(tipo) ;
    }

    @Override
    public void deleteTipo(Long id) {
        tipoRepo.deleteById(id);
    }

    @Override
    public Tipo findTipo(Long id) {
        Tipo tipo = tipoRepo.findById(id).orElse(null);
        return tipo;
    }    
}

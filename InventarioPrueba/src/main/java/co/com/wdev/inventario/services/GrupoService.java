package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.GrupoInterface;
import co.com.wdev.inventario.models.Grupo;
import co.com.wdev.inventario.repositories.GrupoRepository;

@Service
public class GrupoService implements GrupoInterface{
    
    
    @Autowired
    public GrupoRepository grupoRepo;
    
    @Override
    public List<Grupo> getGrupo() {
        return grupoRepo.findAll();
    }

    @Override
    public void saveGrupo(Grupo grupo) {
        grupoRepo.save(grupo) ;
    }

    @Override
    public void deleteGrupo(Long id) {
        grupoRepo.deleteById(id);
    }

    @Override
    public Grupo findGrupo(Long id) {
        Grupo grupo = grupoRepo.findById(id).orElse(null);
        return grupo;
    }
    
}

package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.DispositivoInterface;
import co.com.wdev.inventario.models.Dispositivo;
import co.com.wdev.inventario.repositories.DispositivoRepository;

@Service
public class DispositivoService implements DispositivoInterface{

	@Autowired
    public DispositivoRepository dispositivoRepo;
    
    @Override
    public List<Dispositivo> getDispositivo() {
        return dispositivoRepo.findAll();
    }

    @Override
    public void saveDispositivo(Dispositivo dispositivo) {
        dispositivoRepo.save(dispositivo) ;
    }

    @Override
    public void deleteDispositivo(Long id) {
        dispositivoRepo.deleteById(id);
    }

    @Override
    public Dispositivo findDispositivo(Long id) {
    	Dispositivo dispositivo = dispositivoRepo.findById(id).orElse(null);
        return dispositivo;
    }  
}

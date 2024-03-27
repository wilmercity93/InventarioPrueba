package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Dispositivo;

public interface DispositivoInterface {
    
    public List<Dispositivo> getDispositivo();
    
    public void saveDispositivo(Dispositivo dispositivo);
    
    public void deleteDispositivo (Long id);
    
    public Dispositivo findDispositivo(Long id);

}

package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Modelo;

public interface ModeloInterface {
    public List<Modelo> getModelo();
    
    public void saveModelo(Modelo modelo);
    
    public void deleteModelo (Long id);
    
    public Modelo findModelo (Long id);
}

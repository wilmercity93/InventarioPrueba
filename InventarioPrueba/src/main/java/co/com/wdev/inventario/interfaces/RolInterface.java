package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Rol;
import co.com.wdev.inventario.models.Tipo;


public interface RolInterface {
    public List<Rol> getRol();
    
    public void saveRol(Rol rol);
    
    public void deleteRol (Long id);
    
    public Rol findRol(Long id);
}

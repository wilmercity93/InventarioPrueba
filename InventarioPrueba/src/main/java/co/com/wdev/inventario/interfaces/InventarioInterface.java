package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Inventario;

public interface InventarioInterface {
    
    public List<Inventario> getInventario();
    
    public void saveInventario(Inventario inventario);
    
    public void deleteInventario (Long id);
    
    public Inventario findInventario(Long id);
}

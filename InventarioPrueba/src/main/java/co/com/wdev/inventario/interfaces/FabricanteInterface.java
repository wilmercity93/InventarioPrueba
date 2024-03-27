package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Fabricante;

public interface FabricanteInterface {
    
    public List<Fabricante> getFabricante();
    
    public void saveFabricante(Fabricante fabricante);
    
    public void deleteFabricante (Long id);
    
    public Fabricante findFabricante(Long id);

}

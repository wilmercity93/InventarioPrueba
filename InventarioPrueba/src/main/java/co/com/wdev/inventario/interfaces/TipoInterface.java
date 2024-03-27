package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Tipo;


public interface TipoInterface {
    
    public List<Tipo> getTipo();
    
    public void saveTipo(Tipo tipo);
    
    public void deleteTipo (Long id);
    
    public Tipo findTipo(Long id);

}

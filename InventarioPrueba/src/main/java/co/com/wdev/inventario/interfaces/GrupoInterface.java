package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.Grupo;

public interface GrupoInterface {
    
    public List<Grupo> getGrupo ();
    
    public void saveGrupo (Grupo grupo);
    
    public void deleteGrupo (Long id);
    
    public Grupo findGrupo (Long id);
}

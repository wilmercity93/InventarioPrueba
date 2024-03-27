package co.com.wdev.inventario.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "modelo")
@Getter 
@Setter
@ToString
public class Modelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "modelo", cascade = CascadeType.ALL )
    List<Fabricante> fabricante;

    public Modelo() {
    }
    
    
    public Modelo(Long id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }
}

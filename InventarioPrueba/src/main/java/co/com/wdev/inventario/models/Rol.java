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
@Table(name = "rol")
@Getter
@Setter
@ToString
public class Rol {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "rol", cascade = CascadeType.ALL )
    List<User> user;
    
    public Rol () {
    }
    
    public Rol (Long id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }
}
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
@Table(name = "tipo")
@Getter 
@Setter
@ToString
public class Tipo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;
    
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "tipo", cascade = CascadeType.ALL )
    List<Dispositivo> dispositivo;
    
    public Tipo() {
    }

	public Tipo(Long id, String descripcion, List<Dispositivo> dispositivo) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.dispositivo = dispositivo;
	}

}

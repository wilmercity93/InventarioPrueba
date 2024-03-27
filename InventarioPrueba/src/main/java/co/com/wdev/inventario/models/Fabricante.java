package co.com.wdev.inventario.models;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "fabricante")	
@Getter 
@Setter
@ToString
public class Fabricante {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;
    
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "fabricante", cascade = CascadeType.ALL )
    List<Dispositivo> dispositivo;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "modelo_id")
    private Modelo modelo;
    
    public Fabricante() {
    }

	public Fabricante(Long id, String descripcion, List<Dispositivo> dispositivo) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.dispositivo = dispositivo;
	}

}

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
@Table(name = "dispositivo")
@Getter 
@Setter
@ToString
public class Dispositivo {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;
    private String serie;
    private boolean estado;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "dispositivo", cascade = CascadeType.ALL )
    List<Inventario> inventario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tipo_id")
    private Tipo tipo;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fabricante_id")
    private Fabricante fabricante;
    
    
    public Dispositivo() {
    }

	public Dispositivo(Long id, String descripcion, String serie, boolean estado, Tipo tipo, Fabricante fabricante) {
		super();
		this.id = id;
		this.descripcion = descripcion;
		this.serie = serie;
		this.estado = estado;
		this.tipo = tipo;
		this.fabricante = fabricante;
	}
	
}

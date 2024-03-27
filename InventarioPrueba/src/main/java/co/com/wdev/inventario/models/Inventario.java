package co.com.wdev.inventario.models;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "inventario")
@Getter 
@Setter
@ToString
public class Inventario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer numero;
    private String comentario;
    private boolean estadoGeneral;
    

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_person")
    private Rol person;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "grupo_id")
    private Grupo grupo;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dispositivo_id")
    private Dispositivo dispositivo;
    
    
    public Inventario() {
    }


	public Inventario(Long id, Integer numero, String comentario, boolean estadoGeneral, Rol person, Grupo grupo,
			User user, Dispositivo dispositivo) {
		super();
		this.id = id;
		this.numero = numero;
		this.comentario = comentario;
		this.estadoGeneral = estadoGeneral;
		this.person = person;
		this.grupo = grupo;
		this.user = user;
		this.dispositivo = dispositivo;
	}
    
}

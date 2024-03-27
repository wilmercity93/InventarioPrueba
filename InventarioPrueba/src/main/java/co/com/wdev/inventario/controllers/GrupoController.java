package co.com.wdev.inventario.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import co.com.wdev.inventario.interfaces.GrupoInterface;
import co.com.wdev.inventario.models.Grupo;


@RestController
@RequestMapping("api/v1/grupo")//localhost:8080/grupo
public class GrupoController {
    
    @GetMapping("/test")
    public String test(){
        return "Hola GrupoController";
    }

    @Autowired
    private GrupoInterface grupoService;
    
    @GetMapping ("/todos")
    @ResponseBody
    public List<Grupo> getGrupo(){
        return grupoService.getGrupo();
    }
    
    @GetMapping ("/ver/{id}")
    @ResponseBody
    public Grupo seeGrupo(@PathVariable Long id){
        return grupoService.findGrupo(id);
    }
    
    @PostMapping("/nuevo")
    public ResponseEntity<Grupo> addGrupo(@RequestBody Grupo grupo){
        grupoService.saveGrupo(grupo);
        return ResponseEntity.ok().body(grupo);
    }
        
    @DeleteMapping ("/ver/{id}")
    public ResponseEntity deleteGrupo(@PathVariable Long id){
        grupoService.deleteGrupo(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity <?> editGrupo(@PathVariable("id") Long id, @RequestBody Grupo grupo) {
        Grupo exp = grupoService.findGrupo(id);
        exp = grupo;

       grupoService.saveGrupo(exp);
        return new ResponseEntity(HttpStatus.OK);
    }
}

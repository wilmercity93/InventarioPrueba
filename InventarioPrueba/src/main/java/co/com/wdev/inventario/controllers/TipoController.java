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
import co.com.wdev.inventario.interfaces.TipoInterface;
import co.com.wdev.inventario.models.Tipo;


@RestController
@RequestMapping("api/v1/tipo") //localhost:8080/tipo
public class TipoController {
    
    @GetMapping("/test")
    public String test(){
        return "Hola TipoController";
    }

    @Autowired
    private TipoInterface tipoService;
    
    @GetMapping ("/todos")
    @ResponseBody
    public List<Tipo> getTipo(){
        return tipoService.getTipo();
    }
    
    @GetMapping ("/ver/{id}")
    @ResponseBody
    public Tipo seeTipo(@PathVariable Long id){
        return tipoService.findTipo(id);
    }
    
    @PostMapping("/nuevo")
    public ResponseEntity<Tipo> addTipo(@RequestBody Tipo tipo){
        tipoService.saveTipo(tipo);
        return ResponseEntity.ok().body(tipo);
    }
        
    @DeleteMapping ("/ver/{id}")
    public ResponseEntity deleteTipo(@PathVariable Long id){
        tipoService.deleteTipo(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity <?> editTipo(@PathVariable("id") Long id, @RequestBody Tipo tipo) {
        Tipo exp = tipoService.findTipo(id);
        exp = tipo;

       tipoService.saveTipo(exp);
        return new ResponseEntity(HttpStatus.OK);
    }
}

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
import co.com.wdev.inventario.interfaces.ModeloInterface;
import co.com.wdev.inventario.models.Modelo;


@RestController
@RequestMapping("api/v1/modelo")//localhost:8080/modelo
public class ModeloController {
    
    @GetMapping("/test")
    public String test(){
        return "Hola ModeloController";
    }

    @Autowired
    private ModeloInterface modeloService;
    
    @GetMapping ("/todos")
    @ResponseBody
    public List<Modelo> getModelo(){
        return modeloService.getModelo();
    }
    
    @GetMapping ("/ver/{id}")
    @ResponseBody
    public Modelo seeModelo(@PathVariable Long id){
        return modeloService.findModelo(id);
    }
    
    @PostMapping("/nuevo")
    public ResponseEntity<Modelo> addModelo(@RequestBody Modelo modelo){
        modeloService.saveModelo(modelo);
        return ResponseEntity.ok().body(modelo);
    }
        
    @DeleteMapping ("/ver/{id}")
    public ResponseEntity deleteModelo(@PathVariable Long id){
        modeloService.deleteModelo(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity <?> editModelo(@PathVariable("id") Long id, @RequestBody Modelo modelo) {
        Modelo exp = modeloService.findModelo(id);
        exp = modelo;

       modeloService.saveModelo(exp);
        return new ResponseEntity(HttpStatus.OK);
    }
}

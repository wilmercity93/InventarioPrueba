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

import co.com.wdev.inventario.interfaces.DispositivoInterface;
import co.com.wdev.inventario.models.Dispositivo;


@RestController
@RequestMapping("api/v1/dispositivo")//localhost:8080/dispositivo
public class DispositivoController {
    
    @GetMapping("/test")
    public String test(){
        return "Hola DispositivoController";
    }

    @Autowired
    private DispositivoInterface dispositivoService;
    
    @GetMapping ("/todos")
    @ResponseBody
    public List<Dispositivo> getDispositivo(){
        return dispositivoService.getDispositivo();
    }
    
    @GetMapping ("/ver/{id}")
    @ResponseBody
    public Dispositivo seeDispositivo(@PathVariable Long id){
        return dispositivoService.findDispositivo(id);
    }
    
    @PostMapping("/nuevo")
    public ResponseEntity<Dispositivo> addDispositivo(@RequestBody Dispositivo dispositivo){
        dispositivoService.saveDispositivo(dispositivo);
        return ResponseEntity.ok().body(dispositivo);
    }
        
    @DeleteMapping ("/ver/{id}")
    public ResponseEntity deleteDispositivo(@PathVariable Long id){
        dispositivoService.deleteDispositivo(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity <?> editDispositivo(@PathVariable("id") Long id, @RequestBody Dispositivo dispositivo) {
        Dispositivo exp = dispositivoService.findDispositivo(id);
        exp = dispositivo;

       dispositivoService.saveDispositivo(exp);
        return new ResponseEntity(HttpStatus.OK);
    }
}

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
import co.com.wdev.inventario.interfaces.RolInterface;
import co.com.wdev.inventario.models.Rol;


@RestController
@RequestMapping("api/v1/rol")//localhost:8080/rol
public class RolController {
    
    @GetMapping("/test")
    public String test(){
        return "Hola RolController";
    }

    @Autowired
    private RolInterface rolService;
    
    @GetMapping ("/todos")
    @ResponseBody
    public List<Rol> getRol(){
        return rolService.getRol();
    }
    
    @GetMapping ("/ver/{id}")
    @ResponseBody
    public Rol seeRol(@PathVariable Long id){
        return rolService.findRol(id);
    }
    
    @PostMapping("/nuevo")
    public ResponseEntity<Rol> addRol(@RequestBody Rol rol){
        rolService.saveRol(rol);
        return ResponseEntity.ok().body(rol);
    }
        
    @DeleteMapping ("/ver/{id}")
    public ResponseEntity deleteRol(@PathVariable Long id){
        rolService.deleteRol(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity <?> editRol(@PathVariable("id") Long id, @RequestBody Rol rol) {
        Rol exp = rolService.findRol(id);
        exp = rol;

       rolService.saveRol(exp);
        return new ResponseEntity(HttpStatus.OK);
    }
}

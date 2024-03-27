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
import co.com.wdev.inventario.interfaces.FabricanteInterface;
import co.com.wdev.inventario.models.Fabricante;


@RestController
@RequestMapping("api/v1/fabricante") //localhost:8080/fabricante
public class FabricanteController {
    
    @GetMapping("/test")
    public String test(){
        return "Hola FabricanteController";
    }

    @Autowired
    private FabricanteInterface fabricanteService;
    
    @GetMapping ("/todos")
    @ResponseBody
    public List<Fabricante> getFabricante(){
        return fabricanteService.getFabricante();
    }
    
    @GetMapping ("/ver/{id}")
    @ResponseBody
    public Fabricante seeFabricante(@PathVariable Long id){
        return fabricanteService.findFabricante(id);
    }
    
    @PostMapping("/nuevo")
    public ResponseEntity<Fabricante> addFabricante(@RequestBody Fabricante fabricante){
        fabricanteService.saveFabricante(fabricante);
        return ResponseEntity.ok().body(fabricante);
    }
        
    @DeleteMapping ("/ver/{id}")
    public ResponseEntity deleteFabricante(@PathVariable Long id){
        fabricanteService.deleteFabricante(id);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PutMapping("/edit/{id}")
    public ResponseEntity <?> editFabricante(@PathVariable("id") Long id, @RequestBody Fabricante fabricante) {
        Fabricante exp = fabricanteService.findFabricante(id);
        exp = fabricante;

       fabricanteService.saveFabricante(exp);
        return new ResponseEntity(HttpStatus.OK);
    }
}

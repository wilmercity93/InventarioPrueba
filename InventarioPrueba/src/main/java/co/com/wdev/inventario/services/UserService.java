package co.com.wdev.inventario.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.com.wdev.inventario.interfaces.UserInterface;
import co.com.wdev.inventario.models.User;
import co.com.wdev.inventario.repositories.UserRepository;

@Service
public class UserService implements UserInterface{
    
    @Autowired
    public UserRepository userRepo;
    
    @Override
    public List<User> getUser() {
        return userRepo.findAll();
    }

    @Override
    public void saveUser(User user) {
        userRepo.save(user) ;
    }

    @Override
    public void deleteUser(Long id) {
        userRepo.deleteById(id);
    }

    @Override
    public User findUser(Long id) {
        User user = userRepo.findById(id).orElse(null);
        return user;
    }  
}

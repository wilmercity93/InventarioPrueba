package co.com.wdev.inventario.interfaces;

import java.util.List;

import co.com.wdev.inventario.models.User;

public interface UserInterface {
    
    public List<User> getUser();
    
    public void saveUser(User task);
    
    public void deleteUser (Long id);
    
    public User findUser(Long id);
}

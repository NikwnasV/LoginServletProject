package com.nikonas.service;

import com.nikonas.dao.UserDAO;
import com.nikonas.exception.AuthException;
import com.nikonas.model.UserModel;
import java.util.List;

public class UserServiceImpl implements UserService{
    
    private static UserServiceImpl instance;
    
    private UserServiceImpl() {
        
    }
    
    public static synchronized UserServiceImpl getInstance() {
        if(instance == null) {
            instance = new UserServiceImpl();
        }
        return instance;
    }
    
    @Override
    public void register(String email, String password, String name, String role) {
        UserModel user = new UserModel();
        user.setEmail(email);
        user.setName(name);
        user.setPassword(password);
        user.setRole(role);
        UserDAO.getInstance().save(user);
    }
    
    @Override
    public UserModel auth(String uname, String password) throws AuthException{
       UserModel user = UserDAO.getInstance().findByUnameAndPassword(uname, password);
       if(user == null) {
          throw new AuthException("Credentials are incorrect!");
       }
       return user;
    }

    public List<UserModel> getAllUsers() {
        return (List<UserModel>) UserDAO.getInstance().getAllUsers();
    }
    
    @Override
    public void deleteUser(String username){
        UserDAO.getInstance().delete(username);
    }
}

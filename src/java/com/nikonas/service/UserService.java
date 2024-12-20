package com.nikonas.service;

import com.nikonas.exception.AuthException;
import com.nikonas.model.UserModel;

public interface UserService {
    void register(String email, String psw, String name, String role);
    UserModel auth(String email, String password)  throws AuthException;
    void deleteUser(String name);
//    void adminRegister(String email, String password, String name, String role);
}

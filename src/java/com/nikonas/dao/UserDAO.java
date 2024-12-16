package com.nikonas.dao;

import com.nikonas.config.DBConnectionConfig;
import com.nikonas.model.UserModel;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    
    private static UserDAO instance;
    
    private UserDAO() {
    
    }
    
    public static synchronized UserDAO getInstance() {
        if(instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }
    
    public void save(UserModel user) {
        Connection connection = DBConnectionConfig.getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement("insert into users "
                    + "(username, password, email, role) VALUES (?, ?, ?, ?)");
            pr.setString(1, user.getName());
            pr.setString(2, user.getPassword());
            pr.setString(3, user.getEmail());
            pr.setString(4, "user");
            pr.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public UserModel findByUnameAndPassword(String uname, String password) {
    Connection connection = DBConnectionConfig.getConnection();
    UserModel user = null;
    try {
        PreparedStatement pr = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        pr.setString(1, uname);
        pr.setString(2, password);

        ResultSet rs = pr.executeQuery();
        if (rs.next()) {
            user = new UserModel();
            user.setName(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
        } else {
            System.out.println("No user found with username: " + uname + " and provided password.");
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Database error during login", ex);
    }
    return user;
}

}

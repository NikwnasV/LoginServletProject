package com.nikonas;

import com.nikonas.exception.AuthException;
import com.nikonas.model.UserModel;
import com.nikonas.service.UserServiceImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.equals("/main-page")) {
            HttpSession session = request.getSession(false);
            if(session == null || session.getAttribute("user") == null) {
            response.sendRedirect("/index");
            }else{
                UserModel user = (UserModel) session.getAttribute("user");
                request.setAttribute("user", user);
                request.getRequestDispatcher("/WEB-INF/view/main-page.jsp").forward(request, response);
            }
        }else if(uri.equals("/register")){
            String method = request.getMethod();
            if(method.equals("GET")){
                request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
            }else {
                String email = request.getParameter("email");
                String psw = request.getParameter("psw");
                String uname = request.getParameter("uname");
                String role = "User";
                UserServiceImpl.getInstance().register(email,psw,uname,role);
                response.sendRedirect("/index");
            }

        }else if(uri.equals("/admin-page")) {
            HttpSession session = request.getSession(false); // Get the existing session, if any
            if (session == null || session.getAttribute("admin") == null) {
                // If no session or user is not admin, redirect to access denied
                response.sendRedirect("/access-denied");
                return;
            }
            UserServiceImpl userService = UserServiceImpl.getInstance();
            List<UserModel> users = userService.getAllUsers();
            // Set users list as a request attribute for displaying in JSP
            request.setAttribute("users", users);
//            List<UserModel> users = new ArrayList<>();
//            users.add(new UserModel("Nikolakis", "Varsakaj", "ice18390040@uniwa.gr", "Admin"));
//            users.add(new UserModel("Xaralampis", "Oikonomaj", "ice1839041@uniwa.gr", "User"));
//            users.add(new UserModel("Argi", "Psychopadaj", "ice138940107@uniwa.gr", "User"));
//            users.add(new UserModel("Theodor","Vasalaj", "ice18390151@uniwa.gr", "User"));
//            request.setAttribute("users", users);
//            String uname = request.getParameter("uname");
//            String psw = request.getParameter("psw");
//            request.setAttribute("welcomeMessage", "Hi " + uname + "! " + "Your password is : " + psw);
            request.getRequestDispatcher("/WEB-INF/view/admin-page.jsp").forward(request, response);
            session.invalidate();
        }else{
            String method = request.getMethod();
            if(method.equals("GET")) {
                request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
            }else {
                String uname = request.getParameter("uname");
                String psw = request.getParameter("psw");
                try {
                    UserModel user = UserServiceImpl.getInstance().auth(uname, psw);
                    String username = user.getName();
                    String email = user.getEmail();
                    String role = user.getRole();
                    HttpSession session = request.getSession();
                    session.setAttribute(role, user);
                    session.setAttribute(uname, username);
                    session.setAttribute(email, email);
                    if(role.equals("admin")){
                        response.sendRedirect("/admin-page");
                    }else{
                        response.sendRedirect("/main-page");
                    }
                } catch (AuthException ex) {
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                    request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

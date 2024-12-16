<%-- 
    Document   : main-page
    Created on : Dec 12, 2024, 3:34:48 PM
    Author     : nikwn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        
        <style>
#Users {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#Users td, #Users th {
  border: 1px solid #ddd;
  padding: 8px;
}

#Users tr:nth-child(even) {
  background-color: #f2f2f2;
}

#Users tr:hover {
  background-color: #ddd;
}

#Users th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
        </style>
    </head>
    <body>
        <h1>You have successfully logged in!</h1>
        <p>${welcomeMessage}</p>
           
        <table id="Users">
            <tr>
                <th>Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.name}</td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
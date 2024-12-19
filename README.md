Login page using Java servlets + JDBC + JSP.
--------------------------
What does this webapp do ? 
--------------------------
Below are the pages you can access currently :

Login Page - /index --> Login Page anynone can access.

When logging in the backend checks the database for matches and retreives the role.

If you log-in as a simple user, you will get access to the /main-page.

If you log-in as an admin, you will get access to the /admin-page.

Register Page - /register --> You can access the register page by pressing the button on the login page and register as a new user.

Using Http.sessions a user can access /main-page again after leaving without the need to log in again.

After an admin accesses the /admin-page the session is finallized for security reasons.

---------------
How to run ?
---------------
To run this project you need an Apache Server and a MySQL database.

The project was created using Netbeans IDE and the tests were run using XAMPP.

You need to start the Apache Server and MySQL database first.

Using the phpMyAdmin you can configure the Database.

For the project to run you need to configure a database named 
"users_db" containing a table "users".

The table can be created using the SQL commands shown below :

CREATE DATABASE user_db;
USE user_db;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username varchar(255),
    password varchar(255),
    email varchar(255),
    role varchar(10),
    PRIMARY KEY(username)
    );

There is no way to add a user with role "admin" from the .jsp pages.
If you want to access the /admin-page you need to register a user with the role "admin" manually.

After creating and configuring the Database you can run the application through the Tomcat server if you connect it.
To access the login page you can go to the url : http://localhost:8080
(8080 is the default port for Tomcat).

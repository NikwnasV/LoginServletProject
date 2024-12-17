<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.5.0/remixicon.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Work Sans', sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #360427, #3f1a8a, #3a0969);
            background-size: cover;
            background-position: center;
            color: #fff;
        }

        .admin-info {
            font-family: 'Work Sans', sans-serif;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 600px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #fff;
        }

        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        table th, table td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        table th {
            font-weight: bold;
            text-transform: uppercase;
            font-size: 14px;
        }

        table tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        a.logout-btn {
            display: inline-block;
            margin-top: 20px;
            background: linear-gradient(to right, #f05b2e, #AB47BC);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 40px;
            text-decoration: none;
            font-family: 'Work Sans', sans-serif;
            font-size: 18px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
        }

        a.logout-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 10px rgba(171, 71, 188, 0.5);
            background: linear-gradient(to right, #AB47BC, #CE93D8);
        }
    </style>
</head>
<body>
    <div class="admin-info">
        <h1>Welcome, Admin!</h1>
        <p>Database information is displayed below:</p>

        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                </tr>
            </c:forEach>
        </table>

        <a href="/logout" class="logout-btn">Logout</a>
    </div>
</body>
</html>

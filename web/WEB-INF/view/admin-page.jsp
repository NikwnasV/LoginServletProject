<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            padding: 20px;
            color: #fff;
            background: linear-gradient(135deg, #360427, #3f1a8a, #3a0969);
            background-size: cover;
            background-position: center;
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
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

        /* Action Buttons Section */
        .action-buttons {
            display: flex;
            justify-content: flex-start; /* Align buttons side-by-side */
            gap: 10px; /* Space between buttons */
        }

        button.action-button {
            background: linear-gradient(to right, #f05b2e, #AB47BC);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 20px;
            cursor: pointer;
            font-family: 'Work Sans', sans-serif;
            font-size: 14px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
            width: 85px;
            text-align: center;
        }

        button.action-button:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 10px rgba(171, 71, 188, 0.5);
            background: linear-gradient(to right, #AB47BC, #CE93D8);
        }

        /* Input Container Styles */
        .input-container {
            display: flex;
            flex-direction: column;
            gap: 5px;
            margin-bottom: 15px;
        }

        input::placeholder {
            color: #e0e0e0;
            font-family: 'Work Sans', sans-serif;
            font-weight: 300;
        }
        
        .input-wrapper {
            font-family: 'Work Sans', sans-serif;
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            padding: 10px;
            gap: 10px;
        }

        .input-wrapper i {
            color: #ddd;
            font-size: 18px;
        }

        .input-wrapper input {
            flex: 1;
            border: none;
            background: transparent;
            color: #fff;
            font-size: 14px;
            outline: none;
        }

        .input-wrapper input::placeholder {
            color: #e0e0e0;
            font-weight: 300;
        }

        button.add-user-btn {
            background: linear-gradient(to right, #f05b2e, #AB47BC);
            color: white;
            border: none;
            padding: 10px;
            border-radius: 40px;
            cursor: pointer;
            font-family: 'Work Sans', sans-serif;
            font-size: 18px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 250px;
            margin: 20px auto;
            display: block;
        }

        button.add-user-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 10px rgba(171, 71, 188, 0.5);
            background: linear-gradient(to right, #AB47BC, #CE93D8);
        }
            </style>
</head>
<body>
    <h1>Welcome, Admin!</h1>

    <!-- Users Table -->
    <h2>User Management</h2>
    <table id="Users">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>
                    <div class="action-buttons">
                        <!-- Edit Button -->
                        <form action="/admin-page" method="get" style="display:inline;">
                            <input type="hidden" name="username" value="${user.name}">
                            <button type="submit" class="action-button"> Edit</button>
                        </form>
                        <!-- Delete Button -->
                        <form action="/admin-page" method="post" style="display:inline;">
                            <input type="hidden" name="username" value="${user.name}">
                            <button type="submit" class="action-button"> Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
<!-- Add User Button -->
<div class="container" style="text-align: left; margin-top: 20px;">
    <form action="/admin-register" method="get">
        <button type="submit" class="add-user-btn">Add User</button>
    </form>
</div>

    </form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/27/24
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<form action="/edit" method="post">
    <input type="hidden" value="${user.getId()}" id="id" name="id">
    <div>
        <label for="name">Name:</label>
        <input type="text" value="${user.getName()}" id="name" name="name" required>
    </div>
    <div>
        <label >Email:</label>
        <input type="email" value="${user.getEmail()}" name="email" required>
    </div>
    <div>
        <label >Password:</label>
        <input type="password" value="${user.getPassword()}" name="password" required>
    </div>
    <button type="submit">Edit</button>
</form>
</body>
</html>

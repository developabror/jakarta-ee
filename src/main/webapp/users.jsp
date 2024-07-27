<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/25/24
  Time: 6:00 PM
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
<c:set var="t" value="hello admin"/>
<c:if test="${user.getEmail() eq 'admin@gmail.com'}" />
<c:out value="${t}" />
<table>
    <tr>
        <td>id</td>
        <td>name</td>
        <td>email</td>
        <td>password</td>
    </tr>
    <%--    <c:out value="${users}"></c:out>--%>
    <h1>all users</h1>
    <% %>
    <c:choose>
        <c:when test="${user.getEmail() eq 'admin@gmail.com'}">

            <c:forEach items="${users}" var="u">
                <td> ${u.getId()}</td>
                <td> ${u.getName()}</td>
                <td> ${u.getEmail()}</td>
                <td> ${u.getPassword()}</td>
                <td>
                    <form action='/edit'>
                        <button value="${u.getId()}" name="id" type="submit">edit</button>
                    </form>
                </td>
                </tr>
            </c:forEach>
        </c:when>

        <%--    <c:forEach items="${users}" var="user">--%>
        <c:otherwise>
            <div>
                <tr>
                    <td> ${user.getId()}</td>
                    <td> ${user.getName()}</td>
                    <td> ${user.getEmail()}</td>
                    <td> ${user.getPassword()}</td>
                    <td>
                        <form action='/edit'>
                            <button value="${user.getId()}" name="id" type="submit">edit</button>
                        </form>
                    </td>
                </tr>
            </div>
        </c:otherwise>
    </c:choose>
    <%--    </c:forEach>--%>
</table>


</body>
</html>

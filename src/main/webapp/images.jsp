<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
<table>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>image</th>
        <th>size</th>
    </tr>

    <c:forEach items="${attachments}" var="temp">
        <tr>

            <th>${temp.getId()}</th>
            <th>${temp.getAttachmentName()}</th>
            <c:choose>
                <c:when test="${temp.getPrefix() == '.mp4'}">
                    <th>
                    <video controls src="/download?id=${temp.getId()}">

                    </video>
                    </th>
                </c:when>
                <c:when test="${temp.getPrefix() == '.mp3'}">
                    <th>
                    <audio controls>
                        <source src="/download?id=${temp.getId()}" type="audio/mp3">
                    </audio>
                    </th>
                </c:when>
                <c:otherwise>
                    <th><img width="200px" height="200px" src="/download?id=${temp.getId()}"></th>
                </c:otherwise>
            </c:choose>
            <th>${temp.getAttachmentSize()}</th>
            <th><form action="/download"><input type="hidden"  id="id" name="id" value="${temp.getId()}">  <button type="submit"> download </button> </form></th>
        </tr>
    </c:forEach>
</table>
<a href="/upload">return to upload file</a>
</body>
</html>

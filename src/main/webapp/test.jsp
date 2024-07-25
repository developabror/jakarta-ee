<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/25/24
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% boolean t = new Random().nextBoolean();%>
<% if (t) { %>
<h1>result is true</h1>
<% } else { %>
<h1>result is false</h1>
<%}%>

</body>
</html>

<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/25/24
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> ${12 gt 12}</h1>
<c:set var="res" value="${fn:length('hello world')}" />

<c:out value=" ${res}" />
<%--<fn: length(var = 'hello') />--%>
</body>
</html>

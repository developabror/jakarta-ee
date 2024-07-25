<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/25/24
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%! int arr[] = new int[]{1, 2, 3, 4, 5, 6, 7};%>
<c:forEach items="${ arr }" var="t">
    <h1>${t}</h1>
</c:forEach>
<%--<c:forTokens items="test, answer, question, result" var="temp" delims=", " >--%>
<%--    <h1><c:out value="${temp}"></c:out></h1>--%>
<%--</c:forTokens>--%>
</body>
</html>

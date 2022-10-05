<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1><%=request.getParameter("name")%>님 혈액형은
    <%=request.getParameter("blood")%>형
</h1>
<h3>차갑다</h3>
</body>
</html>

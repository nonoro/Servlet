<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate(); // 모든 세션정보 삭제
    response.sendRedirect("LoginForm.jsp"); // 폼으로 이동
%>
</body>
</html>

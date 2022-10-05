<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>쿠키 정보 확인하기</h3>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        out.println("쿠키 개수 : " + cookies.length + "<p>");
        for (Cookie cookie : cookies) {
            out.println(cookie + " = " + cookie.getValue() + "<br>");
        }
    } else {
        out.println("<h3>저장된 쿠키 정보가 없습니다.<h3>");
    }
%>
</body>
</html>

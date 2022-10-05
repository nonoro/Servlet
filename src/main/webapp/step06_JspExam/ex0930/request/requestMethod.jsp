<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1> HttpServletRequest - request관련 메소드 </h1>
  <%
    Enumeration<String> headerNames = request.getHeaderNames(); // request의 header 정보에 대한 name들

    while (headerNames.hasMoreElements()) {
      String name = headerNames.nextElement();
      String header = request.getHeader(name);
      out.println(name + ":" + header + "<br>");

    }

  %>

  <hr>
<%--  하나의 서버(9000)안에 여러개의 프로젝트를 관리하는것 getContextPath--%>
  request.getContextPath() = <%=request.getContextPath()%> <p>
  request.getRequestURL() = <%=request.getRequestURL()%> <p>

</body>
</html>

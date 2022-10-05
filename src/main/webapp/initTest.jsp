<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/05
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Context-param 가져오기</h2>
<h4>
    메시지 : <%=application.getInitParameter("message")%> <p>
    driverName : <%=application.getInitParameter("driverName")%> <p>

</h4>

</body>
</html>

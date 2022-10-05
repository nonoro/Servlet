<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/05
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  // 두 수를 받아서 합계를 구한다.
  int num1 = Integer.parseInt(request.getParameter("num1"));
  int num2 = Integer.parseInt(request.getParameter("num2"));
%>

<h3>
  <%=num1%> + <%=num2%> = <%=num1 + num2%>
</h3>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/05
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 전송된 데이터를 숫자로 나눈다
    int num1 = Integer.parseInt(request.getParameter("num1"));

    int result = 100 / num1;
%>

<h3>
    100을 <%=num1%> 로 나눈 결과는 <%=result%>
</h3>
</body>
</html>

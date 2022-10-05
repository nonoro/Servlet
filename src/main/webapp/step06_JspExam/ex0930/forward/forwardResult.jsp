<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 11:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2> forward 결과 - forwardResult.jsp 문서입니다.</h2>

<h3>
    연산결과 : <%=request.getParameter("total")%>
    메시지 : <%=request.getParameter("message")%>
</h3>
</body>
</html>

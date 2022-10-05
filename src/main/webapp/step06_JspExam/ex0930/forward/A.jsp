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
<%--얘는 사실 따로 안넘겨도됨 왜냐면 전 페이지에서 받은 요청을 그대로 가져다 쓸 수 있음 --%>
<h1><%=request.getParameter("name")%>님 혈액형은
    <%=request.getParameter("blood")%>형
</h1>
<h3>소심</h3>
</body>
</html>

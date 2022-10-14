<%@ page import="kosta.dao.TestDAO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/12
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>DBCP Test 하기</h3>
    <%
        TestDAO dao = new TestDAO();
        List<String> list = dao.selectByEname();

        out.println("결과 : " + list);
    %>
</body>
</html>

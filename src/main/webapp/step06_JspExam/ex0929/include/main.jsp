<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/29
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Include 지시자 TEST</h1>

<%@ include file="top.jsp"%>

<hr color="tomato">

<%
    String addr = "서울시 송파구";
%>

<h3>여기는 main.jsp 영역입니다...</h3>

<hr color="blue">

<%@ include file="footer.jsp"%>
</body>
</html>

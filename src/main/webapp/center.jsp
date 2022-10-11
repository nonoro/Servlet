<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/06
  Time: 7:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        /* boardList테이블의 css */
        table {
            border: 1px double tomato;
            border-collapse: collapse;
            width: 100%;
            height: 600px;
        }

        /* boardList테이블 안쪽의 css */
        th {
            border: 1px solid black;

        }
    </style>
</head>
<body>
<%
    /*
       LoginServlet에서 검증되어 넘어온 sessionId값에따라 띄워줄 html 코드를 선택
       true면 로그인 성공하고 나서 뜨는 boardList 테이블 과 등록창
       false면 첫화면에 boardList 테이블만 뜸
   */
    if (session.getAttribute("sessionId") != null) {
%>
    <%-- 중복된 html 코드를 include로 제거 --%>
    <jsp:include page="table.jsp"></jsp:include>

    <form action="board">
    글번호 : <input type="text" name="no" id="no" style="width: 20px; margin-top: 10px"><p>

    제목 : <input type="text" name="subject" id="subject" style="width: 80px;"><p>

    내용 : <input type="text" name="content" id="content" style="width: 150px;"><p>

    <input type="submit" value="등록하기">
    </form>

        <%
    } else {
%>
    <%-- 중복된 html 코드를 include로 제거 --%>
    <jsp:include page="table.jsp"></jsp:include>

    <%
    }
    %>
</body>
</html>

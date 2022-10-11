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
</head>
<body>


<%
    /*
        LoginServlet에서 검증되어 넘어온 sessionId값에따라 띄워줄 html 코드를 선택
        true면 로그인 성공하고 나서 뜨는 페이지
        false면 처음 로그인 페이지
    */

    if (session.getAttribute("sessionId") != null) {
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
    <%=session.getAttribute("sessionId")%>님 로그인중 <p>
    [접속시간 : <%=session.getAttribute("sessionTime")%>]<p>
    <a href="logout">로그아웃</a>
<%
    } else {
        response.sendRedirect("loginForm.html");
        out.println(session.getAttribute("sessionId"));
        out.println(session.getAttribute("sessionTime"));
    }
%>

</body>
</html>

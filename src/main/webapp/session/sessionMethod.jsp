<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1> HttpSession - session 관련 메소드</h1>
<h3>
    session.getId() : <%=session.getId()%> <br>
    session.isNew() : <%=session.isNew()%> <br>
    session.getMaxInactiveInterval() : <%=session.getMaxInactiveInterval()%> <br>
    session.getCreationTime() :
    <%
        long creationTime = session.getCreationTime();
        String date = new Date(creationTime).toLocaleString();
        out.println(creationTime + " : " + date);
    %> <br>
    session.getLastAccessedTime() :
    <%
        long lastAccessedTime = session.getLastAccessedTime();
        String lastTime = new Date(lastAccessedTime).toLocaleString();
        out.println(lastAccessedTime + " : " + lastTime);
    %> <br>

    <hr>
    <%
    // 세션에 정보를 저장
        session.setAttribute("id", "jang");
        session.setAttribute("age", "20");
        session.setAttribute("hobbys", new String[]{"등산", "수영", "낚시", "골프"});
    %>


    저장된 정보 조회하기 <p>
    아이디 : <%=session.getAttribute("id")%> <br>
    나이 : <%=session.getAttribute("age")%> <br>
    취미 : <%=session.getAttribute("hobbys")%> <br>


</h3>

    <a href="sessionGet.jsp"> session정보 확인하러가자! </a>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>
  저장된 정보 조회하기 <p>
  아이디 : <%=session.getAttribute("id")%> <br>
  나이 : <%=session.getAttribute("age")%> <br>
  취미 : <%=session.getAttribute("hobbys")%> <br>
</h3>

<hr>

<h3>
    application영역에 저장된 정보 확인 <p>
    메시지 : <%=application.getAttribute("message")%> <br>
    주소 : <%=application.getAttribute("addr")%> <br>
    메뉴 : <%=application.getAttribute("menu")%> <br>
</h3>

</body>
</html>

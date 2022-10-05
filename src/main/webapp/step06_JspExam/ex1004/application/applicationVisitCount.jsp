<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.concurrent.atomic.AtomicInteger" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--
<%
  // 1. 기존 count 값을 읽어온다.(application영역에 저장된..)
  Object obj = application.getAttribute("count");

  // 2. 만약 1의 값이 null이라면 기본 0으로 세팅!!!
  if (obj == null) {
    application.setAttribute("count", 0);

    obj = application.getAttribute("count");
  }

  // 3. 읽어온 데이터에 +1을 해서 다시 저장하고 화면에 출력한다.
  int count = (int) obj;
  if (session.isNew()) { // 새로고침을 해도 방문자수 안늘어남 isNew의 기능은 처음온 방문자면 true 아니면 false
    count ++; // 증가
    application.setAttribute("count", count);
  }

%>

<h3>방문자 수 : <%=count%> 명</h3>

--%>

<%
  // 1. 기존 count 값을 읽어온다.(application영역에 저장된..)
  Object obj = application.getAttribute("count");

  // 2. 만약 1의 값이 null이라면 기본 0으로 세팅!!!
  if (obj == null) {
    application.setAttribute("count", new AtomicInteger());

    obj = application.getAttribute("count");
  }

  // 3. 읽어온 데이터에 +1을 해서 다시 저장하고 화면에 출력한다.
  // AtomicInteger를 쓴것은 set으로 못바꿈
  AtomicInteger at = (AtomicInteger) obj;
  int count = at.intValue(); // 기존의 값을 얻어오고
  if (session.isNew()) { // 새로고침을 해도 방문자수 안늘어남 isNew의 기능은 처음온 방문자면 true 아니면 false
    count = at.incrementAndGet();// 증가

  }

%>
<h3>방문자 수 : <%=count%> 명</h3>



</body>
</html>

<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> ServletContext - application 관련 메소드 </h3>


  application.getContextPath() : <%= application.getContextPath()%> <br>
<%--  배포용인 application 파일이 실제로 저장되어있는 경로를 찾는 방법  --%>
  application.getRealPath() : <%= application.getRealPath("/")%> <br>

  application.getMajorVersion() : <%= application.getMajorVersion()%> <br>
  application.getMajorVersion() : <%= application.getMinorVersion()%> <br>
  application.getServerInfo() : <%= application.getServerInfo()%> <br>

  <%
    // application영역에 정보 저장
    application.setAttribute("message", "배고프다");
    application.setAttribute("addr", "경기도 성남시 오리역");
    application.setAttribute("menu", Arrays.asList("중식", "한식", "일식"));
  %>

  application영역에 저장된 정보 확인 <p>
  메시지 : <%=application.getAttribute("message")%> <br>
  주소 : <%=application.getAttribute("addr")%> <br>
  메뉴 : <%=application.getAttribute("menu")%> <br>

  <a href="${pageContext.request.contextPath}/step06_JspExam/src/main/webapp/step06_JspExam/ex1004/session/sessionGet.jsp">정보 확인하러 가자</a>





</body>
</html>

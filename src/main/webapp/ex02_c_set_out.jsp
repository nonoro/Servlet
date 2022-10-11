<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/06
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> JSTL - &lt;c:out> and &lt;c:set></h3>

<c:out value="안녕1"/> <br>
<%--
    얘는 따로 escapeXml속성을 안넣어주면 마크업이 실행안됨
    escapeXml이 true면 마크업 실행 x
    escapeXml이 false면 마크업 실행 o
--%>
<c:out value="<h4>안녕2</h4>"/> <br>
<c:out value="<h4>안녕3</h4>" escapeXml="true"/> <br>
<c:out value="<h4>안녕4</h4>" escapeXml="false"/> <br>
<%--표현언어인 얘는 마크업이 무조건 실행됨 그래서 만약 저게 url이였으면 사용자가 원하지않아도 무조건 글로 이동되어서 보안에 문제가있음--%>
${"<h4>안녕5</h4>"}<hr color="tomato">

<%-- 변수 선언 c:set은 setAttribute를 대신해준다--%>
<c:set var="id" value="king"/>
<c:set var="age" value="20" scope="session"/> <!-- page | request | session | application -->
<c:set var="addr" value="제주도" scope="application"/>
<%--session은 현재페이지에서만 값유지 application은 서버가 꺼질때까지 값 유지--%>

<%
    String name = "장희정";
    // xxx.setAttribute("name", name) 이걸해야 아래 표현언어에서 출력됨
%>

<%--지금 ${name} 은 scope내에 저장이 되어있지 않아서 출력이 안됨--%>
이름 : ${name} <br>

<%-- 이렇게 추가해주면 setAttribute안해도 표현언어에서 name 사용가능--%>
<c:set var="name" value="<%=name%>"/>
c:이름 : ${name} <br>

<p> 저장된 정보 출력하기 <p>
아이디 : ${id} /<c:out value="${id}"/> <br>
나이 : ${age} / ${sessionScope.age} /<c:out value="${age}"/> <br>
주소 : ${addr} / ${applicationScope.addr} /<c:out value="${addr}"/> <br>
이름 : ${name} /<c:out value="${name}"/> <br>

    <a href="ex02_result.jsp">확인하러가자</a>



</body>
</html>

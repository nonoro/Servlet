<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/06
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<p> 저장된 정보 출력하기 <p>
  아이디 : ${id} /<c:out value="${id}"/> <br>
  나이 : ${age} / ${sessionScope.age} /<c:out value="${age}"/> <br>
  주소 : ${addr} / ${applicationScope.addr} /<c:out value="${addr}"/> <br>
  이름 : ${name} /<c:out value="${name}"/> <br>

</body>
</html>

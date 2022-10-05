<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/05
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    // 이걸 해주는 이유는 이건 애초에 에러가 발생한거라 네트워크상으로 보면 페이지는 잘뜨지만 500 오류가 떠있음
    // 그래서 IE에서 켤 경우 아예 창이 안켜짐 이런 현상이 발생할 수 있기 때문에 이 페이지는 성공적으로 잘 떠야된다는
    // 200 이라는 상태를 지정해야됨
    response.setStatus(200); // 정상
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>예외가 발생했어요</h3>
예외종류 : <%=exception%> <p>
예외메시지 : <%=exception.getMessage()%> <p>
예외클래스 : <%=exception.getClass()%> <p>

<hr>
<a href="exceptionForm.jsp">폼으로 이동</a>
</body>
</html>

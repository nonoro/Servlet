<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

  request.setCharacterEncoding("UTF-8");
  // 여러가지 정보의 name을 가져오고 싶을때
  Enumeration<String> parameterNames = request.getParameterNames();

  // 요소가 하나라도 있으면 true 없으면 false
  // hasMoreElements()로 존재여부 확인
  while (parameterNames.hasMoreElements()) {
    String name = parameterNames.nextElement(); // 요소를 꺼낸다
    String value = request.getParameter(name);
    out.println(name + " : " + value + "<br>");

  }

%>
</body>
</html>

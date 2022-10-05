<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/29
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // parameter(폼으로) 전송된 데이터 받기 프론트단에서 넘어오는값들은 전부 request.get~~
    String id = request.getParameter("id");
    String addr = request.getParameter("addr");
%>
<h3>footer.jsp입니다</h3>
<h4> 주소 : <%=addr%></h4>
<h4> 개발자 : <%=id%></h4>




</body>
</html>

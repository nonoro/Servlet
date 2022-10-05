<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/29
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>action include TEST</h1>

<jsp:include page="top.jsp"/>

<%
    String addr = "서울-Seoul";

    // 인코딩 변경 원래 인코딩을 쓰면 한글이 깨짐 그래서 이렇게 인코딩을 변경해줘야됨
    request.setCharacterEncoding("UTF-8");
%>

인코딩 : <%=request.getCharacterEncoding()%><br>

<hr color="red">
<h3>여기는 메인입니다</h3>
<hr color="blue">

<%--jsp 얘는 자바코드라서 소스보기하면 안나옴--%>
<%--footer.jsp로 id와 addr 정보를 전송한다.--%>
<jsp:include page="footer.jsp">
    <jsp:param name="id" value="nonoro"/>
    <jsp:param name="addr" value="<%=addr%>"/>
</jsp:include>
</body>
</html>

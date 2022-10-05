<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>액션태그 - foward</h2>
<%

int sum = 0;
  for (int i = 0; i <= 10; i++) {
    // 여기서 println은 WAS에서 WS로 html로 바꿔서 보낼때 줄을 띄워서 보낸다는 뜻 우리가 웹에서 볼때 줄을 띄우는게아님 줄을 띄울거면 <br>을 해야됨
    out.println(i + "<br>");
    sum += i;
  }

 System.out.println("sum =" + sum);

    request.setCharacterEncoding("UTF-8");

/*  out.print("<script>");
  out.print("alert('되니?');");
  out.print("alert('글쎄?');");
  out.print("</script>");*/
%>

<%-- 이렇게하고 forwardTest를 실행하면 화면은 forwardResult 화면이 뜨면서 거기에 sum값이 나옴--%>
<%-- forward는 현재 이 forwardTest를 실행시킨 창에서 내가 page에 준 경로의 파일을열어서 보여주는 기능--%>
<%-- 여기서 지금 즐거운주말이라는 메시지는 인코딩이 utf-8이 아니라서 ??로 감
    따라서 위에 <%%>영역에서 request.setCharacterEncoding("UTF-8");을 통해 보내는 값들을
    전부 UTF-8로 바꿔줘야됨 --%>
<jsp:forward page="forwardResult.jsp">
 <jsp:param name="total" value="<%=sum%>"/>
 <jsp:param name="message" value="즐거운주말"/>
</jsp:forward>

</body>
</html>

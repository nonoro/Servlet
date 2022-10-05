<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
// post방식으로 전송되는 한글데이터의 인코딩처리 필요
request.setCharacterEncoding("UTF-8");

// 전송된 데이터 받기
String name = request.getParameter("name");
String blood = request.getParameter("blood");

%>

<%-- foward는 기존의 request, response를 유지하면서 이동 페이지가 따로 늘어나지않음
따라서 param을 따로 넘길 필요가 없음 그래서 request, response의 값을 그대로 A, AB같은 포워드된 페이지에서 쓸 수 있음--%>

<%-- 이 jsp 코드는 was코드임 근데 was 코드는 동적인것만 오류를 확인하고 다시 ws로 보내줌
그래서 만약에 jsp 코드에 <!-- jsp코드 --> 이렇게 html주석처리를 하면 was 에선 <!-- -->을 인식을 안하고 그 안에
jsp코드만 인식해서 먼저 처리를한상태의 결과를 html로 변환해서 ws에 보내주기 때문에 <!-- -->의 html주석처리가 안먹음
만약 주석을 하고 싶다면 이렇게 해줘야됨 --%>
<%-- 이렇게 주석처리를 해야됨 --%>
<%-- 여기서 중요한것은 실행순서임!!! WAS에서 먼저 jsp코드가 실행되고 그 다음 html주석이 실행돼서 html주석이 안먹는다는걸 명심하자!!!--%>


<jsp:forward page='<%=blood + ".jsp"%>'>
    <jsp:param name="name" value="<%=name%>"/>
    <jsp:param name="blood" value="<%=blood%>"/>
</jsp:forward>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 3:08 PM
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
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  String[] hobbies = request.getParameterValues("hobby");
  String ip = request.getRemoteAddr();
%>


<h3>
  이름 : <%=name%><br>
  나이 : <%=age%><br>

  <%--  하나의 이름으로 값이 여러개 전송될때는 getParameterValues() 사용  --%>
  <%--  만약 이렇게 배열의 요소를 하나씩 뽑아서 한다면 <%=%> 이렇게 =이 들어가면 안됨 --%>
  <%--  =이 들어가면 그냥 출력용 =이 안들어가면 메소드쓰는거 메소드안에선 out.println으로 출력가능 --%>
  취미 :
  <%for (String hobby : hobbies) {
    out.println(hobby);
  }%><br>
  <%--  ip는 내가 내껄로 들어가면 내 ip가 나오지만 남의 ip로 접속했을때 보내기를 눌러보면 내 ip가 나  --%>
  <%--  선생님 주소 http://192.168.0.20:9000/step06_JSPExam/ex0930/request/hobbyPro.jsp  --%>
  <%--  위에보면 선생님 ip는 192.168.0.20 이지만 전송을 누르면 내 ip는 192.168.0.38라고 나온다 --%>
  접속자 ip : <%=ip%><br>
</h3>
</body>
</html>

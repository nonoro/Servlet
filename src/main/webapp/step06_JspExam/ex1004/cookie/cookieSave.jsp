<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> Cookie - 서버가 클라이언트 PC쪽에 정보를 저장하는 기술</h3>
<%
    // 쿠키를 생성해서 저장
    Cookie cookie1 = new Cookie("id", "jang");
    Cookie cookie2 = new Cookie("age", "20");

    // 쿠키에 옵션 설정
    cookie1.setMaxAge(60 * 60 * 24); // 1일
    cookie2.setMaxAge(60 * 60 * 24 * 365); // 1년

    cookie1.setPath("/"); // 쿠키1은 id를 어디서든 접근 가능
    // 쿠키2는 setPath를 안해줘서 이 폴더에서만 접근가능

    // pc쪽에 저장
    // 서버를 다 꺼도 값 사용가능
    response.addCookie(cookie1);
    response.addCookie(cookie2);
%>

<a href="cookieGet.jsp">쿠키 확인하러 가자</a>

</body>
</html>

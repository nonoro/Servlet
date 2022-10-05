<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Long currentTime = System.currentTimeMillis();
    String currentDate = new Date(currentTime).toLocaleString();
    Cookie lastTimeCookie = new Cookie("lastTime", String.valueOf(currentTime));


    if (session.isNew()) {
        out.println("<h2>당신은 처음 방문하셨습니다.</h2><br>");
        lastTimeCookie.setMaxAge(60*60*24*365);
        lastTimeCookie.setPath("/");

        response.addCookie(lastTimeCookie);

    } else {
        String lastDate = "";
        Cookie[] cookies = request.getCookies();
        // 만약 있으면 폼에 출력한다.
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("lastTime")) {
                    lastDate = cookie.getValue();
                    break;
                }
            }
        }
        out.println("<h2>당신의 마지막 접속일은 : " + new Date(Long.valueOf(lastDate)).toLocaleString() + "</h2>");
        lastTimeCookie.setMaxAge(60*60*24*365);
        lastTimeCookie.setPath("/");
        response.addCookie(lastTimeCookie);
    }


%>

<h2>현재접속시간 : <%=currentDate%></h2>
<h2>다시 저장된 시간 : <%=currentTime%></h2>

</body>
</html>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="sun.tools.jconsole.JConsole" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // post방식 인코딩 설정을 위해서
    request.setCharacterEncoding("UTF-8");
// 비교정보
    String dbId = "gyu";
    String dbPw = "1234";

// 전송된 데이터 받기
    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");
    String userName = request.getParameter("userName");

    if (dbId.equals(userId) && dbPw.equals(userPwd)) {
        // 세션에 아이디, 이름, 접속시간을 저장
        session.setAttribute("sessionId", userId);
        session.setAttribute("sessionName", userName);
        // 여기서 로그인 한 순간을 얻고 싶다면 new Date() 근데 지금 여기선
        // 이사이트에 들어온 시간 session.getCreationTime()을 나타냄
        session.setAttribute("creationTime", new Date(session.getCreationTime()).toLocaleString());

        // 이동한다.
        response.sendRedirect("LoginOk.jsp");
    } else {
        out.println("<script>");
        out.println("alert('"+ userName +"님 정보를 다시 확인해 주세요')");
        out.println("history.back()");
        out.println("</script>");

    }

%>


</body>
</html>

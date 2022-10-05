<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String cookieSaveId = "";
    // 쿠키에 저장된 아이디가 있는지 찾는다. - saveId
    Cookie[] cookies = request.getCookies();
    // 만약 있으면 폼에 출력한다.
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("saveId")) {
                cookieSaveId = cookie.getValue();
                break;
            }
        }
    }

%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h2> 회원 인증 Page - Cookie에 id 기억 시키기</h2>
<%--쿠키에 저장되어있는 아이디가 있는지 확인해서 있다면 이 form.jsp문서가 켜질때 id부분에 쿠키에 저장된 id를 넣어줌--%>

<form method="post" action="LoginPro.jsp">
    ID : <input type="text" name="userId" value="<%=cookieSaveId%>"/><br/>
    PWD : <input type="password" name="userPwd"/></br/>
    NAME : <input type="text" name="userName"/></br/>
    <input type="submit" value="로그인"/>
</form>

</body>
</html>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/09/30
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 매번 캐시에 저장하지 않게 하는 기능
    response.setHeader("Cache-Control", "no-store");

    // 세션의 유효시간을 설정
    session.setMaxInactiveInterval(30); // 30초


%>
<html>
<head>
    <title>Title</title>
    <style>
        img {
            width: 300px;
            height: 300px;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.js"></script>
    <script>
<%--    --%>
<%--        $(function () {--%>
<%--            // alert(1);--%>

<%--            $("a").on("click", function () {--%>
<%--                // 모든 세션의 정보를 삭제한다.--%>
<%--                // 이렇게하면 그냥 ok라는 문서를 받았을때  session.invalidate(); 이게 호출됨 그래서 로그아웃 누르기전에 걍 세션이 만료돼버림--%>
<%--                // 이유는 WAS코드가 HTML코드보다 먼저 실행되기 때문에--%>
<%--                &lt;%&ndash;               &lt;%&ndash;%>--%>
<%--                &lt;%&ndash;               session.invalidate();&ndash;%&gt;--%>
<%--                &lt;%&ndash;               %>&ndash;%&gt;--%>

<%--                // 정답--%>
<%--                // 로그아웃 문서를 하나 더 만들어서 거기서 session.invalidate();를 이용해 세션을 삭제해줌--%>
<%--                // 근데 이제 로그아웃해서 loginForm으로 갔을때  뒤로가기를 누르면 전에 있었던 history가 보이게됨--%>
<%--                // 이때 여기서 새로고침을 누르면 세션이 삭제되었기 때문에 정보가 다 사라지지만 새로고침을 누르지않으면--%>
<%--                // 브라우져는 마지막에 기억했던 캐시정보를 불러오는 기능이있어서 뒤로가기를 했을때 리로드가 안됨--%>
<%--                // 그래서 캐시를 삭제해줘야됨 그래서 로그아웃하고나서 새롭게 리로드가 될 수 있도록 해줘야됨--%>
<%--                // 그 기능을 하는 메소드는 response에 있음--%>

<%--                if (confirm("로그아웃할래?")) {--%>
<%--                    location.href = "Logout.jsp";--%>
<%--                }--%>

<%--            });--%>
<%--        });--%>


    </script>
</head>
<body>

<%-- \는 서버코드 이걸 쓰면 문자취급한다 --%>
\${pageContext.request.contextPath} = ${pageContext.request.contextPath} <p>

        <%
        if (session.getAttribute("sessionId") != null) { // 인증된 사용자라면
            // 화면에 출력
    %>
<h3>
    <%=session.getAttribute("sessionName")%>
    (<%=session.getAttribute("sessionId")%>)님 로그인 중
    [접속시간 : <%=session.getAttribute("creationTime")%>]
</h3>
<img src="images/dog.png">
<p>
    <a href="#" id="logout">로그아웃</a>


        <%
        } else {
%>
    <script>
        alert("인증하고 이용해주세요");
        location.href = "LoginForm.jsp";
    </script>
        <%
        }
%>


<%-- onload가 아니여서 제일 아래서 실행해야됨 왜냐면 얘를 head사이에 놓으면 다른 코드들이 랜더링 되고나서 얘가 실행되어야하는데 렌더링 되기전에 실행되어서
돔이 없다고 인식해서 addEventListener 에 값이 안들어옴
--%>
    <script>
        let aaa = document.querySelector("#logout");
        function handleLogout() {
            if (confirm("로그아웃할래?")) {
                location.href = "Logout.jsp";
            }
        }
        aaa.addEventListener("click", handleLogout);
    </script>

</body>
</html>

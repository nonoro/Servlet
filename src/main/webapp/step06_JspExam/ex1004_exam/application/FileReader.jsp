<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>저장된 폴더 목록 List</h2>
<%
//    String realPath = String.valueOf(application.getRealPath("realPath"));

    String url = "/Users/nonoro/JspServlet/src/main/webapp/ex1004_exam/application/save";
//    String url = "realPath";
    File file = new File(url);

    String[] list = file.list();
    for (String fileName : list) {
        out.println("● " + fileName + "<br>");
    }
    out.println("<p>");


%>

<a href="#" id="register">등록하기</a>
<script>
    function handleRegister() {
        location.href = "board_Form.html";
    }

    const register = document.querySelector("#register");
    register.addEventListener("click", handleRegister)
</script>

</body>
</html>

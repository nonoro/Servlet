<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/04
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    // 전송된 데이터 받기 (이름, 제목, 내용)
    long time = System.currentTimeMillis();
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");


//  out.println("이름 : " + name + "<br>");
//  out.println("제목 : " + subject + "<br>");
//  out.println("내용 : " + content + "<br>");
//  out.println("저장시간 : " + time + "<br>");

//  작성자이름_시간.txt 으로 저장 - 작성자이름_System.currentTimeMillis() + ".txt"

    String path = application.getRealPath("/ex1004_exam/application/save/");

    String url = "/Users/nonoro/JspServlet/src/main/webapp/ex1004_exam/application/save/" + name + "_" + time + ".txt";
//    String url = path + name + "_" + time + ".txt";

    // 예외처리 안해도됨 왜냐면 jsp는 servlet으로 변환이 되는데 이때 servlet에서 예외처리를 해줌
    try (BufferedWriter bw = new BufferedWriter(new FileWriter(url))) {
        // 위의 파일의 제목과 내용을 저장한다. ~.write();
        bw.write("이름 : " + name + "\n");
        bw.write("제목 : " + subject + "\n");
        bw.write("내용 : " + content + "\n");
        bw.newLine(); // 개행
        bw.flush();
    } catch (Exception e) {
        e.printStackTrace();
    }
    application.setAttribute("realPath", path);


//  파일 경로 : application.getRealPath("/ex1004_exam/application/save")
//    response.sendRedirect("FileReader.jsp");

%>
<script>
    alert("생성 되었습니다.");
    location.href = "FileReader.jsp";
</script>


</body>
</html>

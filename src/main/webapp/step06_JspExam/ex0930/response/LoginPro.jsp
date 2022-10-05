<%@ page import="java.net.URLEncoder" %><%--
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

    String dbId = "gyu";
    String dbPw = "1234";

    String userId = request.getParameter("userId");
    String userPwd = request.getParameter("userPwd");
    String userName = request.getParameter("userName");

    if (dbId.equals(userId) && dbPw.equals(userPwd)) {
//    if (userId.equals(dbId) && userPwd.equals(dbPw)) { 이렇게 하게되면 받아오는 id가 없을수도있어서 NullpointException이 발생할 확률이 높음
        // 이동 => 리다이렉트 방식은 계속해서 새로운 request, response가 만들어지기 때문에 userName값을 못넘김
        // 따라서 리다이렉트 방식은 정보를 유지하지 않고 새롭게 갈때 씀
//        response.sendRedirect("LoginOk.jsp");

        // 그런데 리다이렉트 방식으로도 전에 있던 request, response를 보낼 수 있음(WAS에서 직접넘기는것)
        // 근데 한글이 깨짐 그래서 넣고자 하는 값에 URLEncoder.encode(userName, "UTF-8") 이렇게 해줌
        response.sendRedirect("LoginOk.jsp?userName=" + URLEncoder.encode(userName, "UTF-8"));

        // forward방식중 메소드 => forward방식은 정보를 유지하면서 갈때 쓰면 좋음 ( 얘는 페이지가 안바뀜 )
//        request.getRequestDispatcher("LoginOk.jsp").forward(request, response);
    } else {
// response.sendRedirect("LoginForm.jsp"); 얘가 먼저 실행되기 때문에 아래 script메시지가 실행이 안됨 따라서 이렇게 같이 쓸 수 없음
// 만약 같이 쓰려면 이동방식을 html이동방식으로 바꿔야됨
%>
<script type = "text/javascript">
alert(`<%=userName%> 님 아이디 또는 비번을 확인해주세요`);

// 이렇게 하면 안됨 왜냐면 userName이 먼저 서버에서 실행되고 html로 바껴서 넘어가는데
// 그때 스트링으로 넘어가기 때문에 사실상 alert(권규정 + "님 아이디~~") 이렇게 됨 따라서 스트링값은 "" 가없으면
// 자바스크립트에서 인식을 못함
// 그리고 이건 프론트 오류라서 백단의 콘솔엔 오류가 안뜸 따라서 무조건 f12를 눌러서 콘솔을 확인을해야됨
<%--alert(<%=userName%> + "님 아이디 또는 비번을 확인해주세요");--%>

// html이동방식
// location.href = "LoginForm.jsp"; // 얘는 그냥 새로운 페이지가 다시 나오는거라 정보가 안남아있음
history.back(); // 뒤로가기 얘는 이전에 정보가 남아있음(비밀번호빼고)(근데 내껀나옴)
</script>
<%
//        response.sendRedirect("LoginForm.jsp");
    }

%>



</body>
</html>

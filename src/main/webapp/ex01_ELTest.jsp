<%@ page import="java.util.Arrays" %>
<%@ page import="ex1006.el.Product" %><%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/06
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3> EL(Expression Language) = 표현언어 </h3>
<h4>
    <%--    \이걸 붙이면 텍스트로 취급
            ${} EL표현언어 서버코드라서
             \${5} = ${5} 여기서 ${5} 이거 자체는 웹 소스로 공개가 안됨 웹에서 소스보기하면 그냥 5 이렇게 나옴
    --%>
    \${5} = ${5} <br>
    \${5 + 2} = ${5 + 2} <br>
    \${5 * 2} = ${5 * 2} <br>
    \${5 > 3} = ${5 > 3} <br>
    \${5 lt 10} = ${5 lt 10} <br>

    \${"안녕"} = ${"안녕"} <br>
    \${'반가워'} = ${'반가워'} <br>

    \${5 gt 3 && 10 eq 10} = ${5 gt 3 && 10 eq 10} <br>
    \${5 gt 3 and 10 eq 10} = ${5 gt 3 and 10 eq 10} <br>

    \${5 gt 3 ? "크다" : "작다"} = ${5 gt 3 ? "크다" : "작다"}
    <hr>
</h4>

<%--
만약,
    http://localhost:9001/ex01_ELTest.jsp?age=10&id=값
        이렇게 요청이 된다고 가정하고 나이를 출력해보고 나이에 따른
        성인, 미성년자를 출력한다.
--%>

<%--<%
원래 이짓을 해야됨 그리고 request.getParameter("age")이렇게 했을때 값이 없으면 null이 뜸 근데 ${param.age살} 을하면 null이 안뜸 걍 값이 없는것처럼뜸
   int age = Integer.parseInt(request.getParameter("age"));
   if(age > 18)
%>--%>


나이 : ${param.age}살<br>
구분 : ${param.age > 18 ? "성인" : "미성년자"} <br>

아이디 : ${param.id == null ? "guest" : param.id} <br>
아이디 : ${empty param.id == null ? "guest" : param.id} <br>

아이디 : ${param.id == null ? param.id : "guest"} <br>
아이디 : ${not empty param.id == null ? param.id : "guest"} <br>


<%-- 표현언어에서 문자열 연결하는 방법 여기 안에서의 + 는 연산을 하려고함 그래서 문자열을 합치고싶을때 + 를 하면 안됨
     문자열을 합치는방법
        1. += "님"
        2. param.id.concat("님")
--%>
아이디 : ${param.id == null ? "guest" : param.id}님 <br>

아이디 : ${param.id == null ? "guest" : param.id += "님"} <br>
아이디 : ${param.id == null ? "guest" : param.id.concat("님")}
<hr>

Scope영역(pageContext &lt; request &lt; session &lt; application) 있는 정보 가져오기 <br>
<%
    // 정보 저장
    request.setAttribute("id", "kgu1022");

    session.setAttribute("addr", "오리역");
    session.setAttribute("message", "표현언어 연습중 ...");

    application.setAttribute("message", "즐거운 연휴다!!!");
    application.setAttribute("hobbys", Arrays.asList("축구", "농구", "야구", "탁구", "골프", "테니스"));
%>

아이디(request) : <%=request.getParameter("id")%> / ${requestScope.id} / ${id} <br>

addr(session) : <%=session.getAttribute("addr")%> / ${sessionScope.addr} / ${addr} <br>
message(session) : <%=session.getAttribute("message")%> / ${sessionScope.message} / ${message} <br>

<%--여기서 보면 message는 이름이 중복되기 때문에 그냥 ${message}를 했을때
    Scope가 가장 작은 범위에서부터 찾아서 제일 먼저 찾은걸 출력해버림
    Scope 범위 : pageContext < request < session < application 따라서 pageContext부터 찾음
--%>
message(application) : <%=application.getAttribute("message")%> / ${applicationScope.message} / ${message} <br>
hobbys(application) : <%=application.getAttribute("hobbys")%> / ${applicationScope.hobbys} / ${hobbys} <br>

<p>자바 객체의 속성 및 메소드 접근
<p>
    <%--
    <%
            Product p = new Product();
            out.println(p.getCode());
    %>
    --%>

    <%-- 객체 생성 --%>
    <jsp:useBean id="p" class="ex1006.el.Product"/>
    상품코드 : <%=p.getCode() %> / ${p.code} /  <!-- p.getCode() 호출 --> <br>
    상품이름 : <%=p.getName() %> / ${p.name} <br> <!-- getName() 호출 -->
    가격 : <%=p.getPrice() %>원 / ${p.price}원 / <fmt:formatNumber value="${p.price}"/>원<br>
    수량 : <%=p.getQty() %> / ${p.qty} <br>
    총금액(가격 * 수량) : <%=p.getPrice() * p.getQty()%>원 / ${p.price * p.qty}원 / <fmt:formatNumber value="${p.price * p.qty}"/>원<br>


<hr>
<a href="ex03_if_choose.jsp">이동1</a> <p>
<a href="/ex03_if_choose.jsp">이동2</a> <p>
<a href="${pageContext.request.contextPath}/ex03_if_choose.jsp">이동3</a> <p>
</body>
</html>

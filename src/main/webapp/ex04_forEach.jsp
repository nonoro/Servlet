<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/06
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            width: 400px;
            border: 1px solid tomato;
            border-collapse: collapse;
        }

        th, td {
            text-align: center;
            padding: 5px;
            border: 1px solid gray;
        }

    </style>

    <script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>

    <script>
        $(function () {
            // alert(1);
            $("tr:odd").css({backgroundColor:"skyblue"}); // 홀수 근데 번지수 0부터시작 그래서 보이기는 짝수처럼보임

            $("tr:even").css({backgroundColor:"pink"});

            $("tr:eq(0)").css({backgroundColor:"orange", color:"white"});

        });

    </script>


</head>
<body>
<h3>> &lt;c:forEach 연습하기 </h3>

<c:forEach var="i" begin="1" end="10">
    ${i}
</c:forEach>

<hr>
<%
    String hobbys[] = {"등산", "수영", "낚시", "골프"};
//    request.setAttribute("hobbys", hobbys);
%>

\${hobbys} = ${hobbys}<br>

<%--    <c:forEach var="hobby" items="<%=hobbys%>" varStatus="state"> 여기서 items에 리스트를 넣으면 알아서 돌아가고
    거기다가 varStatus를 넣으면 카운트 수도 세줌

--%>


<c:forEach var="hobby" items="<%=hobbys%>" varStatus="state">
    ${hobby} / ${state.index} / ${state.count} <br>
</c:forEach>

<hr>
<h4> Bean에 있는 데이터 출력 </h4>
<%--  ex1006.jstl.ForEachBean에 있는 메서드, 변수들을 사용하기위한 useBean코드 --%>
<jsp:useBean id="bean" class="ex1006.jstl.ForEachBean"/>


    menus: ${bean.menus}<p>
    names: ${bean.names}<p>
    boardList: ${bean.boardList}<p>
    map: ${bean.map}<p>

<hr>
<select name="menu">
    <option value="0">--선택--</option>
    <c:forEach items="${bean.menus}" var="menu">
    <option value="${menu}">${menu}</option>
    </c:forEach>
</select>

<p>
<fieldset>
    <legend>이름선택</legend>
    <c:forEach items="${bean.names}" var="name" varStatus="state">
        <input type="checkbox" name="userName" value="${state.count}"> ${name}
    </c:forEach>
</fieldset>

<p>
<table>
    <tr>
        <th>순서</th>
        <th>번호</th>
        <th>제목</th>
    </tr>
<%--    보드리스트는 객체를 담고있음 그래서 var로 값하나 뽑아도 board객체의 주소가 나옴--%>
    <c:forEach items="${bean.boardList}" var="board" varStatus="state">
        <tr>
            <td>${state.count}</td>
            <td>${board.no}</td> <%-- board.getNo() 호출 --%>
            <td>${board.subject}</td> <%-- board.getSubject() 호출 --%>
        </tr>
    </c:forEach>
</table>

<hr color="red">

<%--
        map을 이용한 반복분 - radio
        <input type="radio" value="kr" >대한민국
 --%>

<fieldset>
    <legend>나라선택</legend>
    <c:forEach items="${bean.map}" var="nation">
        <input type="radio" name="nation" value="${nation.key}"> ${nation.value}
    </c:forEach>
</fieldset>
<p>

가격 : 3526102000원 / <fmt:formatNumber value="3526102000"/>원


</body>
</html>

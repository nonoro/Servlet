<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/06
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.6.1.min.js"></script>
    <script>
        <%--$(function (){--%>
        <%--    &lt;%&ndash; job이 전송되었다면 전송된 value값이 선택! 여기서 제이쿼리랑 표현문장의 $이 같은게아니라 헷깔릴 수 있지만 실행을 하면--%>
        <%--     제이쿼리의 $를 실행하지 않고 ${param.job}이게 먼저 실행되어서 값을 가져오게된다&ndash;%&gt;--%>
        <%--    if ("${param.job}" !== "" && "${param.job}" !== "0") {--%>
        <%--        $("[name = job]").val("${param.job}");--%>
        <%--    }--%>
        <%--});--%>

    </script>
</head>
<body>
<h3> JSTL - &lt;c:if>와 &lt;c:choose></h3>

<%--
  만약, 요청할때 http://localhost:9001/ex03_if_choose.jsp?age=값
  된다면 age의 값이 있으면 "당신의 나이는 ~살입니다." 출력

  * 나이가 18보다 크면 성인입니다. 이용해주세요.
    아니면 미성년자이므로 서비스를 이용할 수 없습니다.
--%>


<c:if test="${not empty param.age}" var="result">
    <h2 style="color: tomato">당신의 나이는 ${param.age}살 입니다.</h2>
</c:if>

결과 : ${result}

<hr>
<c:choose>
    <c:when test="${param.age > 18}">
        <h4 content="blue">성인입니다. 이용해주세요.</h4>
    </c:when>
    <c:otherwise>
        <h4 style="color: tomato"> ${param.age}살은 미성년자이므로 서비스를 이용할 수 없습니다.</h4>
    </c:otherwise>
</c:choose>

<hr>

<form action="ex03_if_choose.jsp">
    이름 : <input type="text" name="name" value="${param.name}"> <br>
    선택 :
    <select name="job">
        <option value="0">--선택--</option>
        <option value="개발자">개발자</option>
        <option value="디자이너">디자이너</option>
        <option value="DBA">DBA</option>
        <option value="기획자">기획자</option>
    </select>

    <input type="submit" value="전송하기">
</form>

<script>
    if ("${param.job}" !== "" && "${param.job}" !== "0") {

        let a = document.querySelector("[name=job]")

          a.value = "${param.job}"

    }

</script>



<%--
    1. 만약 name과 job이 전송된다면 "~님 직업은 ~입니다." 출력

    2. job의 종류에 따른 메시지를 출력
        개발자 : ???
        디자이너 : ???

    3. 값이 전송되었다면 전송된 값으로 폼에 출력되게 한다.


--%>


<c:if test="${not empty param.name && not empty param.job}">
    <h2 style="color: tomato">${param.name}님 직업은 ${param.job == "0" ? "없습니다" : param.job += "입니다"}</h2>

    <c:choose>
        <c:when test="${param.job == '개발자'}">
            <h2>servlet 재밌어~~~</h2>
        </c:when>
        <c:when test="${param.job == '디자이너'}">
            <h2>헤어커트 2만원</h2>
        </c:when>
        <c:when test="${param.job == 'DBA'}">
            <h2>오라클맨~</h2>
        </c:when>
        <c:when test="${param.job == '기획자'}">
            <h2>기획이 제일어려워~</h2>
        </c:when>
        <c:otherwise>
            <h2>선택된게 없습니다~</h2>
        </c:otherwise>
    </c:choose>
</c:if>


<hr>

${applicationScope.list}




</body>
</html>

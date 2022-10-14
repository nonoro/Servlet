<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        table {
            width: 100%;
        }

        th, td {
            padding: 5px;
            border: 1px solid pink;
            text-align: center
        }

        a {
            text-decoration: none
        }
    </style>
    <script async src="/webjars/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(function () {
            $("[value=삭제]").on("click", (function () {
                // input 버튼에서 부모인 th에 부모인 tr로 가서 tr안에있는 th중에 0 1 2 3 4 ~~ 중 1번째 있는애의 값을 가져옴 애는 value가 아니라 text
                if (confirm("정말삭제하실래요?")) {
                    let text = $(this).parent().parent().find("th:eq(1)").text();
                    // alert(text);
                    location.href = "${pageContext.request.contextPath}/delete?id=" + text;
                }
            }));

            $("[name=search]").on("submit", function () {
                if ($("[name=keyField]").val() == "0") {
                    alert("검색필드를 선택해주세요");
                    /*false를 한 이유는 submit특성상 무조건 엔터든 클릭이든 눌러지면 페이지를 이동하는데 그 성질을 없앰*/
                    return false;
                }

                if ($("[name=keyWord]").val() == "") {
                    alert("검색단어를 입력해주세요.");
                    $("[name=keyWord]").focus();
                    return false;
                }

            });


        });
    </script>

</head>

<body>


<div style="text-align: center">
    <h1>[ 회원 정보 LIST ]</h1>
    <table cellspacing="0">
        <tr>
            <th colspan="9" style="text-align:right">
                <a href="memberForm.html">[ 회원가입 ]</a>&nbsp;&nbsp;&nbsp;
                <a href="index.jsp">[ 새로고침 ]</a>&nbsp;&nbsp;&nbsp;
            </th>
        </tr>
        <tr bgColor="pink">
            <th>번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>주소</th>
            <th>연락처</th>
            <th>가입일</th>
            <th>삭제</th>
        </tr>

        <c:choose>
            <c:when test="${empty members}">
                <tr><th colspan="9">검색된 정보가 없습니다</th></tr>
            </c:when>
            <c:otherwise>
                <%--  scope에 저장된 정보를 forEach를 이용해서 출력한다  --%>
                <%--  String id, String pwd, String name, int age, String phone, String addr, String joinDate--%>
                <c:forEach items="${members}" var="member" varStatus="state">
                    <tr>
                        <th>${state.count}</th>
                        <th><a href="${pageContext.request.contextPath}/read?id=${member.id}">${member.id}</a></th>
                        <th>${member.pwd}</th>
                        <th>${member.name}</th>
                        <th>${member.age}</th>
                        <th>${member.phone}</th>
                        <th>${member.addr}</th>
                            <%--formatDate는 날짜타입을 가져와서 그 날짜에서 년월일 만 뽑아서 만드는거임 근데 joinDate는 String이라 이거 적용이 안됨
                            따라서 db에서 가져온 String 을 날짜형식으로 변환
                            이런 작업이 귀찮으면 애초에 오라클에서 변환해서 가져오면됨
                            ---%>
                        <th>
                                <%--스트링을 날짜형식으로 바꾼다음 그걸 var를 이용해서 fmtDate로 저장하고--%>
                            <fmt:parseDate value="${member.joinDate}" pattern="yyyy-MM-dd HH:mm:ss" var="fmtDate"/>
                                <%--날짜형식으로 바뀐 fmtDate를 formatDate에 넣어서 원하는 날짜형식으로 바꾼다--%>
                            <fmt:formatDate value="${fmtDate}" pattern="yyyy-MM-dd HH"/>
                        </th>
                        <th>
                            <input type="button" value="삭제">
                        </th>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </table>
    <p>

    <form name="search" action="${pageContext.request.contextPath}/search" method="post">
        <select name="keyField">
            <option value="0">--선택--</option>
            <option value="id">아이디</option>
            <option value="name">이름</option>
            <option value="addr">주소</option>
        </select>
        <input type="text" name="keyWord"/>
<%--    얘를 버튼으로 안하고 서브밋으로 하는이유는 아무것도 안치고 클릭말고 엔터를 쳣을때 서치로넘어가버림
        그래서 버튼을 서브밋으로 바꿈
--%>
        <input type="submit" value="검색"/>
    </form>
</div>


</body>
</html>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nonoro
  Date: 2022/10/09
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table style="width: 400px; height: 150px; border: 5px double tomato;  margin-right: auto; margin-left: 10px">
    <caption> Board List </caption>
    <tr>
        <th>no</th>
        <th>subject</th>
        <th>content</th>
    </tr>
    <c:forEach var="board" items="${applicationScope.boardList}">
        <tr>
            <th>
                    ${board.no}
            </th>
            <th>
                    ${board.subject}
            </th>
            <th>
                    ${board.content}
            </th>
        </tr>
    </c:forEach>
</table>
</body>
</html>

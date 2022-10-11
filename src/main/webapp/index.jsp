<%@ page import="java.util.List" %>
<%@ page import="ex1006.dto.BoardDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        /*전체 테이블의 css*/
        table {
            border: 1px double tomato;
            border-collapse: collapse;
            width: 1000px;
            height: auto;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
            margin-top: 50px;
        }

        /* 전체 테이블 안쪽의 css */
        th, td {
            border: 1px solid black;
        }

        /* iframe의 css */
        .td1 {
            height: 500px;
            vertical-align: top;
        }

        /* top, footer의 높이를 맞추기위한 css */
        .th1 {
            height: 100px;
        }

        /* Board List의 제목 css */
        caption {
            padding: 20px 20px 20px 20px;
            font-weight: bold;
        }

        /* center와 left iframe의 css */
        .iframebox {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%;
        }
        .iframebox iframe {
            position: absolute;
            width: 100%;
            height: 100%;
        }

    </style>

</head>
<body>
<table>
    <%-- top.jsp include --%>
    <tr>
        <th class="th1" colspan="2">
            <jsp:include page="top.jsp"></jsp:include>
        </th>
    </tr>
    <%-- top.jsp include --%>
        <tr>
        <td class="td1" style="width: 250px">
            <div style="padding: 10px 1px 1px 3px">
                <iframe src="left.jsp" frameborder="0" allowfullscreen></iframe>
            </div>
        </td>

    <%-- center.jsp iframe --%>
        <td class="td1">
            <div class="iframebox">
            <iframe src="center.jsp" frameborder="0" allowfullscreen></iframe>
            </div>
        </td>
    </tr>

    <%-- footer.jsp include --%>
    <tr>
        <th class="th1" colspan="2">
            <jsp:include page="footer.jsp"></jsp:include>
        </th>
    </tr>
</table>

</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <style>
    table {border: 5px groove pink; width:500px}
    td,th{border:1px black solid ;  padding:10px}

    input{border:solid 1px gray}
  </style>
</head>
<body>


  <table cellspacing="0" align="center">
    <caption><h2> ${member.name} 님 회원정보 </h2></caption>
    <tr>
      <td width="100px">ID</td>
      <td width="400px">${member.id}</td>
    </tr>
    <tr>
      <td>PWD</td>
      <td>${member.pwd}</td>
    </tr>
    <tr>
      <td>NAME</td>
      <td>${member.name}</td>
    </tr>
    <tr>
      <td>age</td>
      <td>${member.age}</td>
    </tr>
    <tr>
      <td>Phone</td>
      <td>${member.phone}</td>
    </tr>
    <tr>
      <td>Addr</td>
      <td>${member.addr}</td>
    </tr>
    <tr>
      <td>JoinDate</td>
      <td>${member.joinDate}</td>
    </tr>
    <tr>
      <td colspan="2" style="text-align: center;background-color: pink">
        <a href="index.jsp">홈으로</a>
      </td>
    </tr>
  </table>
</body>
</html>







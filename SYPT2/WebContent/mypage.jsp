<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*, javax.swing.* ,sypt.*,javax.servlet.jsp.*"%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="DAO" property="*" />
<%

	request.setCharacterEncoding("utf-8");
	String id_mem = (String) session.getAttribute("UID");
	if (id_mem == null) {
		response.sendRedirect("login.jsp");

	} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<title>SYPT - SYstem Programming Trainer</title>
</head>
<body>
<center>
<div class="container">

	<h3>마이페이지</h3>
<%
		Member member = new Member();
		member = DAO.loadMemInfo(id_mem);

%>
<table class="table table-bordered">

  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=id_mem %></td>
    </tr>
    <tr>
      <th scope="row">이름</th>
      <td><%=member.getName_mem()%></td>
    </tr>
    <tr>
      <th scope="row">성별</th>
      <td><%=member.getGender() %></td>
    </tr>
    <tr>
      <th scope="row">생일</th>
      <td><%=member.getBirthday() %></td>
    </tr>
  </tbody>
</table>
<div class="form-group">
<form method="post" action=controller.jsp?action=changePW>
<Input type="submit" class="btn btn-primary-outline" value="비밀번호 수정">
</form>
</div>
</div>
</center>
</body>
</html>

<%//수정하려면 member.getPassword()와 일치하는지 jsp에서 확인하고 새로 입력한 비밀번호는 DAO.changeMemPassword()로 변경
} %>
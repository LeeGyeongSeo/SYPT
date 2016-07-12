<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	function checkIt() {
		var userinput = document.userinput;

		if (!userinput.oldPW.value) {
			alert("현재 비밀번호를 입력하세요");
			userinput.oldPW.focus();
			return false;
		}
		if (!userinput.newPW.value) {
			alert("변경할 비밀번호를 입력하세요");
			userinput.newPW.focus();
			return false;
		}
		if (userinput.newPW.value != userinput.newPW2.value) {
			alert("변경할 비밀번호를 동일하게 입력하세요");
			userinput.newPW2.focus();
			return false;
		}

		return true;
	}
</script>

<title>SYPT - 비밀번호 변경</title>
</head>
<body>
	<center>
		<div class="container">
			<form name=userinput method="post" action=controller.jsp?action=pwcheck onSubmit="return checkIt()">
				<div class="form-group">
					<label for="exampleInputPassword1">현재 비밀번호</label> <input
						type="password" name="oldPW" class="form-control"
						id="exampleInputPassword1" placeholder="Password"> <input
						type="hidden" name="id_mem" value="<%=id_mem%>">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">새 비밀번호</label> <input
						type="password" name="newPW" class="form-control"
						id="exampleInputPassword1" placeholder="New Password">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">새 비밀번호 확인</label> <input
						type="password" name="newPW2" class="form-control"
						id="exampleInputPassword1" placeholder="New Password">
				</div>
				<button type="submit" class="btn btn-default">변경</button>
			</form>
		</div>
	</center>
</body>
</html>
<%}%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
	<div class="container">

		<div class="btn-group btn-group-justified">
			<div class="btn-group">
			
			<form method="post" action=controller.jsp?action=kernel>
				<button type="submit" class="btn btn-primary">커널 분석</button>
				</form>
			</div>
			<div class="btn-group"><form method="post" action=controller.jsp?action=searchFunction>
				<button type="submit" class="btn btn-primary">함수 검색</button>
				</form>
			</div>
			<div class="btn-group"><form method="post" action=controller.jsp?action=help>
				<button type="submit" class="btn btn-primary">도움말</button>
				</form>
			</div>
			<div class="btn-group"><form method="post" action=controller.jsp?action=mypage>
				<button type="submit" class="btn btn-primary">마이페이지</button>
				</form>
			</div>
			<div class="btn-group"><form method="post" action=controller.jsp?action=logout>
				<button type="submit" class="btn btn-primary">로그아웃</button>
				</form>
			</div>
		</div>
		
		<h3><%=id_mem%>님 로그인되었습니다~~~~~~~~~~ 메인화면 ~~~~</h3>
	</div>
</body>
</html>
<%}%>
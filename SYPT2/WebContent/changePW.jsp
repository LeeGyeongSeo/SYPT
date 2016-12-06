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
<head><jsp:include page="include/header.jsp"/>

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
</head>
<body>
<div id="page-wrapper">

	<!-- Header -->
	<div id="header-wrapper">
		<div id="header" class="container">
			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><h1 id="logo">SYPT</h1></li>
						<li><a class="icon fa-home" href="/main.jsp"><span>메인</span></a></li>
						<li><a class="icon fa-sitemap" href="/controller.jsp?action=kernel"><span>커널분석기</span></a></li>
						<li><a class="icon fa-cog" href="/controller.jsp?action=mypage"><span>마이페이지</span></a></li>
						<li><a class="icon fa-sign-out" href="/controller.jsp?action=logout"><span>로그아웃</span></a></li>
					</ul>
				</nav>

		</div>
	</div>

	<!-- Main -->
	<div id="main-wrapper">
		<div id="main" class="container">

			<form name=userinput method="post" action=controller.jsp?action=pwcheck onSubmit="return checkIt()" style="text-align: center;">
				<div class="form-group">
					<label for="exampleInputPassword1">현재 비밀번호</label> 
					<input type="password" name="oldPW"
						id="exampleInputPassword1" placeholder="Password"> <!-- 
					<input type="hidden" name="id_mem" value="Current Password"> -->
				</div><br>
				<div class="form-group">
					<label for="exampleInputPassword1">새 비밀번호</label> 
					<input type="password" name="newPW"
						id="exampleInputPassword1" placeholder="New Password">
				</div><br>
				<div class="form-group">
					<label for="exampleInputPassword1">새 비밀번호 확인</label> 
					<input type="password" name="newPW2"
						id="exampleInputPassword1" placeholder="New Password">
				</div><br>
				<button type="submit" class="button icon fa-pencil">변경</button>
			</form>

		</div>
	</div>
	<jsp:include page="include/footer.jsp"/>
</div>
</body>
</html>

<%}%>
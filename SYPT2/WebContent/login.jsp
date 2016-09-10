<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
	<jsp:include page="include/header.jsp"/>
	<script type="text/javascript">
	   function checkInput(){    
	       var logininput = document.userinput;
	       if(!logininput.id.value){
	           alert("ID를 입력하세요");
	           logininput.id.focus();
	           return false;
	       }
	       if(!logininput.password.value){
	           alert("비밀번호를 입력하세요");
	           logininput.password.focus();
	           return false;
	       }
	
	       return true;
	   }
	
	</script>
</head>
<body class="homepage">
	<div id="page-wrapper">

	<!-- Header -->
		<div id="login-header-wrapper">
			<div id="login-header" class="container">

			<!-- Logo -->
				<h1 id="logo">SYPT</a></h1>
				<p><b>SYSTEM PROGRAMMING TRAINER</b><br>
				 MANUFACTURED BY TEAM ERRORLESS</p>

			</div>
		</div>

	<!-- Features -->
		<div id="features-wrapper">
			<section id="features" class="container">
				<header><h2>LOGIN</h2></header>
				<div class="row">
					<div class="12u">
						<section>
							<form method="post" name=logininput action=controller.jsp?action=loginCheck 
																onSubmit="return checkInput()">
								<div class="row">
									<div class="12u" align="center">
										<input name="id_mem" placeholder="Email" type="email" /><br>
										<input name="password" placeholder="Password" type="password" />
									</div>
								</div>
								<ul class="actions">
									<li><input class="fa fa-sign-in" type="submit" value="로그인"></li>
									<li><input class="fa fa-file-text-o" type="button" onclick="location.href='join.jsp'" value="회원가입"></li>
								</ul>
							</form>
						</section>
					</div>
				</div>

			</section>
		</div>

	<jsp:include page="include/footer.jsp"/>
	</div>
</body>

</html>
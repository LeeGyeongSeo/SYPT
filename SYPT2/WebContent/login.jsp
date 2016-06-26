<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

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
<title>Login</title>
</head>
<body>
	<center>
		<br>
		<h1>로 그 인</h1>
		<div class="container">
			<form class="form-horizontal" name=logininput method="post"
				action=controller.jsp?action=loginCheck
				onSubmit="return checkInput()">
				<div class="form-group">
					<label for="inputEmail3" class="col-md-3 control-label">아이디</label>
					<div class="col-md-5">
						<input type="email" class="form-control" id="exampleInputEmail1"
							placeholder="Email" name="id_mem">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-md-3 control-label">비밀번호</label>
					<div class="col-md-5">
						<input type="password" class="form-control" name="password"
							id="exampleInputPassword1" placeholder="Password" maxlength="45">
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default">로그인</button>
					<form><input type="button" class="btn btn-default"
						onclick="location.href='join.jsp'" value="회원가입">
					</form>
				</div>
			</form>
		</div>
	</center>
</body>
</html>
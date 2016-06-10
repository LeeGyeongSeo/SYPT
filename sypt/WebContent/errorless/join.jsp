<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Join</title>
</head>
<body>
	<center>
		<br>
		<h1>회원가입</h1>
	</center>
	<div class="container">
		<form class="form-horizontal" name=form2 method="post"
			action=joinComplete.jsp>
			<div class="form-group">
				<label for="inputEmail3" class="col-md-3 control-label">아이디</label>
				<div class="col-md-5">
					<input type="email" class="form-control" id="exampleInputEmail1"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-md-3 control-label">비밀번호</label>
				<div class="col-md-5">
					<input type="password" class="form-control"
						id="exampleInputPassword1" placeholder="Password" maxlength="45">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-md-3 control-label">비밀번호 확인</label>
				<div class="col-md-5">
					<input type="password" class="form-control"
						id="exampleInputPassword1" placeholder="Password" maxlength="45">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">성별</label>
				<div class="radio col-md-5">
					<label class="col-md-2"> <input type="radio" name="optionsRadios"
						id="genderMale" value="option1" checked> 남자 </label> 
					<label class="col-md-3"> <input type="radio" name="optionsRadios"
						id="genderFemale" value="option2"> 여자 </label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">생년월일</label>
				<div class="col-md-5" data-date-format="yyyy-mm-dd">
					<input type="text" class="form-control" id="birthday"
						placeholder="yyyy-mm-dd">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button type="submit" class="btn btn-default">회원가입</button>
					<input class="btn btn-default" type="button" value="초기화">
				</div>
			</div>
		</form>
	</div>
</body>
</html>
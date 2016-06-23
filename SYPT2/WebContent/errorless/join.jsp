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

<script type="text/javascript">
    function checkIt(){    
        var userinput = document.userinput;
        if(!userinput.id_mem.value){
            alert("ID를 입력하세요");
            userinput.id_mem.focus();
            return false;
        }
        if(!userinput.password.value){
            alert("비밀번호를 입력하세요");
            userinput.password.focus();
            return false;
        }
        if(userinput.password.value != userinput.password2.value){
            alert("비밀번호를 동일하게 입력하세요");
            userinput.passwd2.focus();
            return false;
        }
        if(!userinput.name_mem.value){
            alert("사용자 이름을 입력하세요");
            userinput.name_mem.focus();
            return false;
        }
        if(!userinput.birthday.value){
            alert("생년월일을 입력하세요");
            userinput.birthday.focus();
            return false;
        }
        return true;
    }
    //아이디 중복 여부를 판단
    function openConfirmid(userinput){
        //url과 사용자 입력 id를 조합합니다.
        url = "idcheck.jsp?id=" + userinput.id_mem.value;
        
        //새로운 윈도우를 엽니다.
        open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrllbar=no,resizable=no,width=300,height=200");
    }
</script>

<title>Join</title>

</head>
<body>
	<center>
		<br>
		<h1>회원가입</h1>
	</center>
	<div class="container">
		<form class="form-horizontal" name=userinput method="post"
			action=controller.jsp?action=joinCheck onSubmit="return checkIt()">
			<div class="form-group">
				<label for="inputEmail3" class="col-md-3 control-label">이메일</label>
				<div class="col-md-5">
					<input type="email" class="form-control" id="exampleInputEmail1"
						placeholder="Email" name="id_mem">
				</div>
				<input class="btn btn-default" type="button" name="confirm_id" value="중복확인" onClick="openConfirmid(this.form)">

			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-md-3 control-label">비밀번호</label>
				<div class="col-md-5">
					<input type="password" class="form-control" name="password"
						id="exampleInputPassword1" placeholder="Password" maxlength="45">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-md-3 control-label">비밀번호 확인</label>
				<div class="col-md-5">
					<input type="password" class="form-control" name="password2"
						id="exampleInputPassword1" placeholder="Password" maxlength="45">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">이름</label>
				<div class="col-md-5">
					<input type="text" class="form-control" name="name_mem"
						id="exampleInputName" maxlength="20">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">성별</label>
				<div class="radio col-md-5">
					<label class="col-md-2"> <input type="radio" name="gender"
						id="genderMale" value="male" checked> 남자 </label> 
					<label class="col-md-3"> <input type="radio" name="gender"
						id="genderFemale" value="female"> 여자 </label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">생년월일</label>
				<div class="col-md-5" data-date-format="yyyy-mm-dd">
					<input type="date" class="form-control" name="birthday">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-9">
					<button type="submit" class="btn btn-default">회원가입</button>
					<input class="btn btn-default" type=reset value="초기화">
				</div>
			</div>
		</form>
	</div>
</body>
</html>
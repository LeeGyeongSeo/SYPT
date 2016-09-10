<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="include/header.jsp"/>
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
			<section id="features" class="container" align="center">
				<header><h2>JOIN</h2></header>
					<form name=userinput method="post"
						action=controller.jsp?action=joinCheck onSubmit="return checkIt()">

						<div class="form-group">
							<label for="exampleInputEmail1">이메일</label>
							<input type="email" id="exampleInputEmail1" placeholder="Email" name="id_mem">
							<button class="fa fa-check" name="confirm_id"></button>
			
						</div><br>
						<div class="form-group">
							<label for="exampleInputPassword1">비밀번호</label>

								<input type="password" name="password"
									id="exampleInputPassword1" placeholder="Password" maxlength="45">

						</div><br>
						<div class="form-group">
							<label for="exampleInputPassword2">비밀번호 확인</label>

								<input type="password" name="password2"
									id="exampleInputPassword2" placeholder="Password" maxlength="45">

						</div><br>
						<div class="form-group">
							<label>이름</label>

								<input type="text" name="name_mem"
									id="exampleInputName" maxlength="20">

						</div><br>
						<div class="form-group">
							<label>성별</label>
							<div class="radio">
								<input type="radio" name="gender"
									id="genderMale" value="male" checked> 남자
								<input type="radio" name="gender"
									id="genderFemale" value="female"> 여자 
							</div>
						</div><br>
						<div class="form-group">
							<label>생년월일</label>
							<div data-date-format="yyyy-mm-dd">
								<input type="date" class="form-control" name="birthday">
							</div>
						</div><br>
	
						<ul class="actions">
							<li><input type="submit" class="fa fa-sign-in" value="회원가입"></li>
							<li><input class="fa fa-file-text-o" type="reset" value="초기화"></li>
						</ul>
					</form>
				

			</section>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, javax.swing.*, javax.servlet.jsp.*, sypt.*"%>
<jsp:useBean id="func" scope="session" class="sypt.Function" />
<jsp:setProperty name="func" property="*" />
<jsp:useBean id="FDAO" scope="session" class="sypt.FunctionDAO" />
<jsp:setProperty name="FDAO" property="*" />

<%
	request.setCharacterEncoding("utf-8");
	String id_mem = (String) session.getAttribute("UID");
	if (id_mem == null) {
		response.sendRedirect("login.jsp");

	} else {
		String searchInput = "kt";
		/* ArrayList<Function> funs = new ArrayList<Function>();
		funs = FDAO.searchFunction(searchInput);
		String[] result = new String[funs.size()];
		for (int i = 0; i < funs.size(); i++) {
			result[i] = funs.get(i).getName_func();
		} */
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

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


<script type="text/javascript">
<%%>

	function cleartext() {
		document.getElementById("textbox").value = "";
	}
</script>
</head>

<body>
	<div class="container">

		<div class="btn-group btn-group-justified">
			<div class="btn-group">

				<form method="post" action=controller.jsp?action=kernel>
					<button type="submit" class="btn btn-primary">커널 분석</button>
				</form>
			</div>
			<div class="btn-group">
				<form method="post" action=controller.jsp?action=searchFunction>
					<button type="submit" class="btn btn-primary">함수 검색</button>
				</form>
			</div>
			<div class="btn-group">
				<form method="post" action=controller.jsp?action=help>
					<button type="submit" class="btn btn-primary">도움말</button>
				</form>
			</div>
			<div class="btn-group">
				<form method="post" action=controller.jsp?action=mypage>
					<button type="submit" class="btn btn-primary">마이페이지</button>
				</form>
			</div>
			<div class="btn-group">
				<form method="post" action=controller.jsp?action=logout>
					<button type="submit" class="btn btn-primary">로그아웃</button>
				</form>
			</div>
		</div>


		<!-- div로 나눠서 왼쪽에 jcterm, 오른쪽에 함수추천 나오게 -->
		<div class="row">
			<div class="col-md-8">
				<iframe width="650" height="400" src="http://52.78.114.138:8080/ajaxswing/apps/jcterm" align="left" frameborder="1" scrolling="yes">
				이 브라우저는 iframe을 지원하지 않습니다.</iframe>
			</div>

			<div class="col-md-4">
				<input id="textbox" type="text"> 
				<input type="button" value="Clear" onClick="cleartext();"> <br>
				<textarea id="searchFunc" rows="10" cols="30" readOnly></textarea>

			</div>
		</div>

	</div>

<script type="text/javascript">
<%-- var temp = [];
<%for(int i=0; i<result.length; i++){ %>
temp.push("<%=result[i]%>" + "\n");
<%}%> --%>

$('#textbox').keyup(function(event) {
	
	<%
	ArrayList<Function> funs = new ArrayList<Function>();
	funs = FDAO.searchFunction(searchInput);
	String[] result = new String[funs.size()];
	for (int i = 0; i < funs.size(); i++) {
		result[i] = funs.get(i).getName_func();
	}
	%>
	var temp = [];
	<%for(int i=0; i<result.length; i++){ %>
	temp.push("<%=result[i]%>" + "\n");
	<%}%>

	$('#searchFunc').empty();
	$.each(temp, function(index, value) {
		$('#searchFunc').append(value);

	});
});
</script>
</body>
</html>
<%
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><jsp:include page="include/header.jsp"/>
<script type="text/javascript">

function check()
{
	f = document.form1;
	
	if(f.func_name.value == "")
	{
		alert("검색할 함수 이름을 입력해주세요.");
		f.id_mem.focus();
		return;
	}
	
	f.submit();
}
</script>

</head>
<body>
<center>
<h1>함수 검색</h1>
<br>
<form name="form1" method="POST" action="Function.jsp">
<table>
<tr>
<td><input type="text" name="func_name"></td>
<td><input type="button" name="search" value="검색" onClick="check()">
</tr>
</table>
</form>
<br>
분류를 선택해주세요.
<br>
<form name="form2" method="POST" action="category.jsp">
<select name="category">
	<option>입출력</option>
	<option>프로세서</option>
	<option>시그널</option>
	<option>날짜와 시간</option>
	<option>메모리 관리</option>
	<option>소켓</option>
	<option>파일 및 디렉토리</option>
	<option>IPC</option>
</select>
<input type="submit" value="찾기"/>
</form>
 
</center>
</body>
</html>
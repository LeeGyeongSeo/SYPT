<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SYPT - SYstem Programming Trainer</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String category = (String)request.getParameter("category");
	
	if(category.equals("입출력"))
	{
		out.print("입출력 관련 함수 입니다."+"<br><br>");
%>
<a href="getchar.txt">getchar()</a><br>
<a href="putchar.txt">putchar()</a><br>
<a href="gets.txt">gets()</a><br>
<a href="puts.txt">puts()</a><br>
<a href="scanf.txt">scanf()</a><br>
<a href="printf.txt">printf()</a><br>
<a href="sscanf.txt">sscanf()</a><br>
<a href="sprintf.txt">sprintf()</a><br>
<a href="fopen.txt">fopen()</a><br>
<a href="fclose.txt">fcloes()</a><br>
<a href="fgetc.txt">fgetc()</a><br>
<a href="fgutc.txt">fputc()</a><br>
<a href="fgets.txt">fgets()</a><br>
<a href="fputs.txt">fputs()</a><br>
<a href="fscanf.txt">fscanf()</a><br>
<a href="fprintf.txt">fprintf()</a><br>
<a href="fread.txt">fread()</a><br>
<a href="fwrite.txt">fwrite()</a><br>
<a href="ungetc.txt">ungetc()</a><br>
<a href="ferror.txt">ferror()</a><br>
<a href="ftell.txt">ftell()</a><br>
<a href="rewind.txt">rewind()</a><br>
<a href="fseek.txt">fseek()</a><br>


<%
	}
	else if(category.equals("시그널"))
	{
		out.print("시그널 관련 함수 입니다."+"<br>");
	}
%>
</body>
</html>
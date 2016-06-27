<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SYPT - SYstem Programming Trainer</title>
</head>
<body>
<%
		String func_name = (String) request.getParameter("func_name");
		
		String name = func_name;
		name = name + ".txt";

		String path = "C:/Users/eunju/git/SYPT2/SYPT2/WebContent/";

		FileReader fr = null;
		char[] buf = new char[512];
		int len = -1;

		try {
			fr = new FileReader(path + name);
			
			while ((len = fr.read(buf)) != -1) {
				String msg = new String(buf, 0, len);
				out.print(msg);
			}			
		}catch (Exception e) {
			out.print("검색한 함수가 존재하지 않습니다.");
		}
%>

</body>
</html>
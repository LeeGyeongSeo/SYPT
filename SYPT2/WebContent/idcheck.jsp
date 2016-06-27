<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sypt.MemberBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>이메일 중복 확인</title>
</head>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="DAO" property="*" />

<body>
<%
	String id = request.getParameter("id");
	boolean check = DAO.IDcheck(id);
    if(check || id.equals("")) {
%>
<table width="300" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td height="39">이미 사용중인 ID입니다.<p></td>
  </tr>
</table>
<form name="checkForm" method="post" action="idcheck.jsp">
<table width="300" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
   		  다른 이메일을 입력하세요.<p>
       <input type="email" name="id" placeholder="Email"> 
       <input type="submit" value="중복확인">
    </td>
  </tr>
</table>
</form>
<%
    } else {
%>
<table width="300" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p><%=id%> 는 사용할 수 있는 ID입니다. </p>
      <input type="button" value="사용하기" onclick="setid()">
    </td>
  </tr>
</table>
<%
    }
%>
</body>
</html>
<script type="text/javascript">
function setid()
    {        
        opener.document.userinput.id_mem.value="<%=id%>";
        self.close();
    }

</script>

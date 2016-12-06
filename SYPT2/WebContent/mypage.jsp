<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*, javax.swing.* ,sypt.*,javax.servlet.jsp.*"%>
<jsp:useBean id="mem" scope="session" class="sypt.Member" />
<jsp:useBean id="DAO" scope="session" class="sypt.MemberDAO" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="DAO" property="*" />
<%

	request.setCharacterEncoding("utf-8");
	String id_mem = (String) session.getAttribute("UID");
	if (id_mem == null) {
		response.sendRedirect("login.jsp");

	} else {
		Member member = new Member();
		member = DAO.loadMemInfo(id_mem);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><jsp:include page="include/header.jsp"/></head>
<body>
<div id="page-wrapper">

	<!-- Header -->
	<div id="header-wrapper">
		<div id="header" class="container">
			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><h1 id="logo">SYPT</h1></li>
						<li><a class="icon fa-home" href="/main.jsp"><span>메인</span></a></li>
						<li><a class="icon fa-sitemap" href="/controller.jsp?action=kernel"><span>커널분석기</span></a></li>
						<li><a class="icon fa-cog" href="/controller.jsp?action=mypage"><span>마이페이지</span></a></li>
						<li><a class="icon fa-sign-out" href="/controller.jsp?action=logout"><span>로그아웃</span></a></li>
					</ul>
				</nav>

		</div>
	</div>

	<!-- Main -->
	<div id="main-wrapper">
		<div id="main" class="container" style="text-align: center;">
			<head><h1>마이페이지</h1><br/></head>
			<table class="alignCenter">
			  <tbody>
			    <tr>
			      <th scope="row">ID</th>
			      <td><%=id_mem %></td>
			    </tr>
			    <tr>
			      <th scope="row">이름</th>
			      <td><%=member.getName_mem()%></td>
			    </tr>
			    <tr>
			      <th scope="row">성별</th>
			      <td><%=member.getGender() %></td>
			    </tr>
			    <tr>
			      <th scope="row">생일</th>
			      <td><%=member.getBirthday() %></td>
			    </tr>
			  </tbody>
			</table>
			<form method="post" action=controller.jsp?action=changePW>
				<input type="submit" class="button icon fa-pencil" value="비밀번호 수정">
			</form>

		</div>
	</div>
	
	<jsp:include page="include/footer.jsp"/>
</div>
</body>
</html>

<%
} %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*, javax.swing.*, javax.servlet.jsp.*, sypt.*, java.net.ServerSocket,
	java.net.Socket, java.io.*"%>
<!-- 	<script type="text/javascript"> -->
<%-- var temp = [];
<%for(int i=0; i<result.length; i++){ %>
temp.push("<%=result[i]%>" + "\n");
<%}%>--%>
<%-- 
$('#textbox').keyup(function(event) {
	
	<%ArrayList<Function> funs = new ArrayList<Function>();
				funs = FDAO.searchFunction(searchInput);
				String[] result = new String[funs.size()];
				for (int i = 0; i < funs.size(); i++) {
					result[i] = funs.get(i).getName_func();
				}%>
	var temp = [];
	<%for (int i = 0; i < result.length; i++) {%>
	temp.push("<%=result[i]%>" + "\n");
	<%}%>

	$('#searchFunc').empty();
	$.each(temp, function(index, value) {
		$('#searchFunc').append(value);

	});
});
</script> --%>

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

    	/* ArrayList<Function> funs = new ArrayList<Function>();
		funs = FDAO.searchFunction(searchInput);
		String[] result = new String[funs.size()];
		for (int i = 0; i < funs.size(); i++) {
			result[i] = funs.get(i).getName_func();
		} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><jsp:include page="include/header.jsp"/></head>

	<body class="right-sidebar">
		<div id="page-wrapper">

		<!-- Header -->
			<div id="header-wrapper">
				<div id="header" class="container">
					<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><h1 id="logo">SYPT</a></h1></li>
							<li><a class="icon fa-home" href="/controller.jsp?action=main"><span>메인</span></a></li>
							<li><a class="icon fa-sitemap" href="/controller.jsp?action=kernel"><span>커널분석기</span></a></li>
							<li><a class="icon fa-cog" href="/controller.jsp?action=mypage"><span>마이페이지</span></a></li>
							<li><a class="icon fa-sign-out" href="/controller.jsp?action=logout"><span>로그아웃</span></a></li>
						</ul>
					</nav>

				</div>
			</div>

		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">

						<!-- Content -->
							<div id="content" class="8u 12u(mobile)">
								<iframe src="http://52.78.134.147:8080/ajaxswing/apps/jcterm"
								frameborder="0" scrolling="yes"> 이 브라우저는 iframe을 지원하지
								않습니다.</iframe>
							</div>

						<!-- Sidebar -->
							<div id="sidebar" class="4u 12u(mobile)">

							<!-- Excerpts -->
							<section>
								<ul class="divided">
									<li>
										<input id="textbox" type="text"> 
										<button onClick="cleartext();" class="fa fa-trash-o">Clear</button>
									</li>
									<li><textarea id="searchFunc" rows="15" cols="48" readOnly></textarea></li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</div>
			
		</div>

</body>
<script type="text/javascript">
	function cleartext() {
		document.getElementById("textbox").value = "";
	}

	$(document).ready(function() {
		function ajaxCall() {
	        $.ajax({
	            type: 'GET',
	            url: 'requestJSON.jsp',
	            //dataType: 'json',
	            cache: 'false',
	            success: function(data) {
	            	$('#searchFunc').load('requestJSON.jsp');
	            	//$('#searchFunc').append(data.sendString);
	            	
	            },
	            error: function(err) {
	            	$('#searchFunc').append('fail');
	            }
	        }) .then(function(data) {
	        	ajaxCall();
	        });
		}
		setTimeout(ajaxCall, 1000);
		
	});

</script>
</html>
<%}%>
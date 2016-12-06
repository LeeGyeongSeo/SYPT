<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.*, sypt.*"%>
<jsp:useBean id="Input" scope="session" class="sypt.SearchInput" />
<jsp:setProperty name="Input" property="*" />
<%
	request.setCharacterEncoding("utf-8");
	String id_mem = (String) session.getAttribute("UID");

	if (id_mem == null) {
		response.sendRedirect("login.jsp");
	} else {

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><jsp:include page="include/header.jsp"/>
		<script>
		function ajaxJsonCall() {
	        $.ajax({
	            type: 'GET',
	            cache: false,
	            url: 'requestJSON.jsp',
	            success: function(data) {
	            	setTimeout(ajaxJsonCall, 800);
	            	if($.trim(data) != <%=Input.getInput()%>){
	            		ajaxFunctionCall($.trim(data));
	            	}
	            }
	        });
		}
		
		function ajaxFunctionCall(str) {
	        $.ajax({
	            type: 'GET',
	            cache: false,
	            data: {param: str},
	            url: 'requestFunction.jsp',
	            success: function(data) {
	             	$('#searchFunc').empty();
		            $('#searchFunc').html($.trim(data));
					
	            }
	        });
		}
		ajaxJsonCall();
		</script>
	</head>

	<body class="right-sidebar">
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
				<div id="main" class="container">
					<div class="row">

						<!-- Content -->
							<div id="content" class="8u 12u(mobile)">
								<iframe src="http://52.78.35.141:8080/ajaxswing/apps/jcterm"
								frameborder="0" scrolling="yes"> 이 브라우저는 iframe을 지원하지
								않습니다.</iframe>
							</div>

						<!-- Sidebar -->
							<div id="sidebar" class="4u 12u(mobile)">

							<!-- Excerpts -->
							<section>
								<ul class="divided">
									<!-- <li>
										<input id="textbox" type="text"> 
										 <button onClick="cleartext();" class="fa fa-trash-o">Clear</button> 
									</li> -->
									<li><textarea id="searchFunc" rows="15" cols="48" readOnly></textarea></li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>

</html>
<%}%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Storming Stack</title>
<style>
</style>
</head>
<body>
	<div class="w3-container" style="padding: 10px;">
		<header>
			<h1 style="display: inline; padding-top: 120px; padding-left: 30px;">
				<a href="index.jsp"><b>Storming Stack</b></a>
				<a href="#"><img src="./images/user_image.png" style="width: 65px;" class="w3-circle w3-right w3-margin"></a>
			</h1>

			<%
				String userID = null;
				if (session.getAttribute("userID") != null) {
					userID = (String) session.getAttribute("userID");
				}
				int pageNumber = 1;
				if (request.getParameter("pageNumber") != null) {
					pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				}
			%>
			<%
				if (userID == null) {
			%>
			<ul class="w3-right w3-margin " style="padding: 20px;">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
			<%
				} else {
			%>
			<ul class="w3-right w3-margin " style="padding: 20px;">
				<li><a href="write.jsp">글쓰기</a></li>
				<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			<%
				}
			%>
		</header>
	</div>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="img/1.jpg">
				</div>
				<div class="item active">
					<img src="img/2.jpg">
				</div>
				<div class="item active">
					<img src="img/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
</body>
</html>
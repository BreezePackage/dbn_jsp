<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Storming Stack</title>
	
	<style>
		body{
			min-width: 850px;
		}
		a {
			text-decoration: none;
		}
		.mySlides {
			display: none;
		}
		img{
			width:100%; height:100%;
		}
	</style>
</head>

<body>
	<div class="w3-container" style="padding: 10px;">
		<header>
			<h1 style="display: block; text-align: center;">
				<a href="index.jsp"><b>Storming Stack</b></a>
			</h1>

			<% String userID=null; if (session.getAttribute("userID") !=null) { userID=(String)
				session.getAttribute("userID"); } int pageNumber=1; if (request.getParameter("pageNumber")
				!=null) { pageNumber=Integer.parseInt(request.getParameter("pageNumber")); } %>
				<% if (userID==null) { %>
				<a href="login.jsp"><img src="./images/user_image.png" style="width: 40px;" class="w3-circle w3-right w3-margin"></a>
				<ul class="w3-right" style="padding: 20px;">
					<li><a href="login.jsp">로그인</a></li>
				</ul>
				<% } else { %>
				<a href="userInfo.jsp"><img src="./images/user_image.png" style="width: 40px;" class="w3-circle w3-right w3-margin"></a>
				<ul class="w3-right" style="padding: 20px;">
					<!--<li><a href="write.jsp">글쓰기</a></li> -->
					<li><a href="logoutAction.jsp">로그아웃</a></li>
				</ul>
				<% } %>
		</header>
	</div>
	
	<!-- 내용 -->
	<div class="w3-content w3-display-container">
		<!--네비게이션-->
		<div class="w3-bar w3-light-grey">
		  <a href="#" class="w3-bar-item w3-button">all tag</a>
		  <a href="#" class="w3-bar-item w3-button">my tag</a>
		</div>
		<hr>

	</div>
</body>

</html>
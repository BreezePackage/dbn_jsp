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
a {
	text-decoration: none;
}

.mySlides {
	display: none;
}
</style>
</head>
<body>
	<div class="w3-container" style="padding: 10px;">
		<header>
			<h1 style="display: inline; padding-top: 120px; padding-left: 30px;">
				<a href="index.jsp"><b>Storming Stack</b></a> <a href="#"><img
					src="./images/user_image.png" style="width: 65px;"
					class="w3-circle w3-right w3-margin"></a>
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

	<div class="w3-content w3-display-container">
		<img class="mySlides" src="./images/1.jpg" style="width: 100%">
		<img class="mySlides" src="./images/2.jpg" style="width: 100%">
		<img class="mySlides" src="./images/3.jpg" style="width: 100%">

		<button class="w3-button w3-black w3-display-left"
			onclick="plusDivs(-1)">&#10094;</button>
		<button class="w3-button w3-black w3-display-right"
			onclick="plusDivs(1)">&#10095;</button>
	</div>

	<script>
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
		}
	</script>
</body>
</html>
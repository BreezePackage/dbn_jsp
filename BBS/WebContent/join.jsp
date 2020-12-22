<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Sign Up</title>
<style>
a{
	text-decoration: none;
}
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
				if (userID != null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
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
<form  class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
<h2 class="w3-center">Sign Up</h2>
 
 <div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="userId" type="text" placeholder="아이디" maxlength="20">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="userPW" type="text" placeholder="비밀번호" maxlength="20">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="userName" type="text" placeholder="이름" maxlength="20">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="userEmail" type="email" placeholder="이메일" maxlength="20">
    </div>
</div>




<p class="w3-center">
<button type ="submit" class="w3-button w3-section w3-blue w3-ripple"> sign </button>
</p>
<script src="htts://code.jquery.com/jquery-3.1.1.min.js"></script>

</form>
</body>
</html>
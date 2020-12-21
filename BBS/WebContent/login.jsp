<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Login</title>
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
     <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
        <img src="./images/user_image.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>
      
	  <form class="w3-container" method = "post" action="loginAction.jsp">
        <div class="w3-section">
          <label><b>UserID</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디" name="userID" maxlength="20" required>
          
          <label><b>Password</b></label>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호" name="userPW" maxlength="20" required>
          
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
          
          <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small"> <a href="/join.jsp">Sign Up</a></span>
      </div>
      
    </div>

      
</body>
</html>
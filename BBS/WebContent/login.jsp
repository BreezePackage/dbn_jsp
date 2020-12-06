<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrp.css">
<title>JSP BBS</title>
</head>
<body>
	<div class= "container">
		<form method="post" action="loginAction.jsp">
			<h3>로그인</h3>
			<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20"/>
			<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20"/>
			<input type="submit" class="btn" value="로그인">
			<div>
				<a href="join.jsp">회원가입</a>
			</div>
		</form>
	</div>
	<script src="htts://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
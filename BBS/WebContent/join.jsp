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
		<form method="post" action="joinAction.jsp">
			<h3>Sign up</h3>
			<div>
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20"/>
			</div>
			<div>
				<input type="text" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20"/>
			</div>
			<div>
				<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20"/>
			</div>
			<div>
				<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20"/>
			</div>
			<div>
				<input type="submit" class="btn" value="등록">
			</div>
		</form>
	</div>
	<script src="htts://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
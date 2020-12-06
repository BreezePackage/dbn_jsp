<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<%
		if(userID == null){
	%>
		<ul>
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="join.jsp">회원가입</a></li>
		</ul>
	<%
		}else{
	%>
		<ul>
			<li><a href="logoutAction.jsp">로그아웃</a></li>
		</ul>
	<%
		}
	%>
	<div class="container">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background: #eeeeee; text-align: center;">번호</th>
					<th style="background: #eeeeee; text-align: center;">제목</th>
					<th style="background: #eeeeee; text-align: center;">작성자</th>
					<th style="background: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>하이</td>
					<td>dy</td>
					<td>1/1</td>
				</tr>
			</tbody>
		</table>
		<a href="write.jsp" class="btn">글쓰기</a>
	</div>
</body>
</html>
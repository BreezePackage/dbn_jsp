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
		<div><a href="bbs.jsp">게시판</a></div>
	<%
		}
	%>
</body>
</html>
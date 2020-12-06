<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id ="user" class="user.User" scope ="page" />
<jsp:setProperty name ="user" property="userID" />
<jsp:setProperty name ="user" property="userPW" />
<jsp:setProperty name ="user" property="userName" />
<jsp:setProperty name ="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP BBS</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		/* 사용자가 필수 항목을 입력하지 않았을 때를 고려하는 조건 */
		if (user.getUserID() == null || user.getUserPW() == null 
		|| user.getUserName()== null || user.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.');");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			out.print(user.getUserID() + user.getUserPW());
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.');"); // id가 P.K이기 때문
				script.println("history.back();");
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 되었습니다');"); // id가 P.K이기 때문
				script.println("location.href = 'main.jsp';");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
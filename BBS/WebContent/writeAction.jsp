<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id ="bbs" class="bbs.Bbs" scope ="page" />
<jsp:setProperty name ="bbs" property="bbsTitle" />
<jsp:setProperty name ="bbs" property="bbsContent" />
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
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		else{	// 로그인이 되어있는 사람
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.');");
				script.println("history.back()");
				script.println("</script>");
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(userID, bbs.getBbsTitle(),bbs.getBbsContent());
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.');"); // id가 P.K이기 때문
					script.println("history.back();");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 성공했습니다.');"); // id가 P.K이기 때문
					script.println("location.href = 'bbs.jsp';");
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");			
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");			
		}
	%>
	<ul>
		<li><a href="logoutAction.jsp">로그아웃</a></li>
	</ul>
	<div class="container">
		<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle()%>"></td>
					</tr>
					<tr>
						<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn" value="글 수정">
		</form>
	</div>
</body>
</html>
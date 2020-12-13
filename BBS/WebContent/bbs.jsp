<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a, a:hover {
		color: #000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++){		
				%>	
				<tr>
					<td><%= list.get(i).getBbsID()%></td>
					<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
					<%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%>
					</a></td>
					<td><%= list.get(i).getUserID()%></td>
					<td><%= list.get(i).getBbsDate()%></td>
				</tr>
				<%
					}
				 %>
			</tbody>
		</table>
		 <%
		 	if(pageNumber != 1){
		 %>
		 	<a href="bbs.jsp?pageNumber=<%= pageNumber - 1 %>">before</a>
		 <%	
		 	}if(bbsDAO.nextPage(pageNumber + 1)){
		 %>
		 	<a href="bbs.jsp?pageNumber=<%= pageNumber + 1 %>">next</a>
		 <%		
		 	}
		 %>
		<a href="write.jsp" class="btn">글쓰기</a>
	</div>
</body>
</html>
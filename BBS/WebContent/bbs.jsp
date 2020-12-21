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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Storming</title>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
ul{	list-style: none;}
</style>
</head>

<body class="w3-light-grey w3-content" style="max-width:1600px">

<div class="w3-container" style="padding:10px;">
<header>
	<h1 style ="display : inline; margin-top:100px;"><b>	Storming</b>
	<a href="#"><img src="./images/user_image.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
	
	
	</h1>
	
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
		<ul class ="w3-right w3-margin " style="padding:30px;">
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="join.jsp">회원가입</a></li>
		</ul>
	<%
		} else {
	%>
		<ul class ="w3-right w3-margin " style="padding:30px;">
			<li><a href="logoutAction.jsp">로그아웃</a></li>
		</ul>
	<%
		}
	%>
	
</header>
</div>





	<div class="w3-row-padding w3-margin-top">

		<%
			BbsDAO bbsDAO = new BbsDAO();
			ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
			for(int i = 0; i < list.size(); i++){		
		%>	

		<div class="w3-third">
		<a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
			<div class="w3-card">
			<img src="img_5terre.jpg" style="width:100%">
				<div class="w3-container">
					<h4><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></h4>
				</div>
			</div>
		</a>
		</div>
		<% } %>
	</div>

	<%
		if(pageNumber != 1){
	%>
		<a href="bbs.jsp?pageNumber=<%= pageNumber - 1 %>">before</a>
	<%	
		} if(bbsDAO.nextPage(pageNumber + 1)){
	%>
		<a href="bbs.jsp?pageNumber=<%= pageNumber + 1 %>">next</a>
	<%		
		}
	%>

</body>
</html>
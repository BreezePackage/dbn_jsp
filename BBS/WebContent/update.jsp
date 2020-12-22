<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
ul{list-style: none;}
</style>
<title>Storming</title>
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
		<div>
			<header>
			<h1 style="display: block; text-align: center;">
				<a href="index.jsp"><b>Storming Stack</b></a>
			</h1>
				<a href="#"><img src="./images/user_image.png" style="width: 40px;" class="w3-circle w3-right w3-margin"></a>

			<% userID=null; if (session.getAttribute("userID") !=null) { userID=(String)
				session.getAttribute("userID"); } int pageNumber=1; if (request.getParameter("pageNumber")
				!=null) { pageNumber=Integer.parseInt(request.getParameter("pageNumber")); } %>
				<% if (userID==null) { %>
					<ul class="w3-right" style="padding: 20px;">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				<% } else { %>
					<ul class="w3-right" style="padding: 20px;">
						<!--<li><a href="write.jsp">글쓰기</a></li> -->
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				<% } %>
		</header>
	</div>
	
	<div class="container">
		<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<div class="w3-col m7" style="margin-left:300px;">
    
      			<div class="w3-row-padding">
        			<div class="w3-col m12">
          				<div class="w3-card w3-round w3-white">
            				<div class="w3-container w3-padding">
              					<h6 class="w3-opacity">글 수정</h6>
              					<p type ="text" placeholder="글 제목" name="bbsTitle" maxlength="50placeholder="글 제목" name="bbsTitle" maxlength="50" contenteditable="true" class="w3-border w3-padding"><%= bbs.getBbsTitle()%></p>
              					<p textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" contenteditable="true" class="w3-border w3-padding"><%= bbs.getBbsContent()%></p>
              					<button type="submit" class="btn w3-button w3-theme"><i class="fa fa-pencil"></i> &nbsp;Post</button> 
            				</div>
          				</div>
        			</div>
      			</div>
    		</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>  
<%@ page import="bbs.BbsDao" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="vieport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/custom.css">
<title>BULLETIN BOARD </title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	
	
	%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="main.jsp">BULLETIN BOARD </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item ">
		        <a class="nav-link" href="main.jsp">Main<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="bbs.jsp">Bulletin Board </a>
		      </li>
		    </ul>
		    <%
		    	if(userID == null){
		    %>
				    <ul class="nav navbar-nav navbar-right">
				    	<li class="dropdown">
					        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" 
					        aria-expanded="false" style="padding-right: 60px;">SIGN IN</a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					          <a class="dropdown-item active"  href="login.jsp" >SIGN IN</a>
					          <a class="dropdown-item" href="join.jsp">JOIN</a>
					        </div>
				       </li>
					</ul>		    
	    
		    <%
		    	} else{
		    %>		
				    <ul class="nav navbar-nav navbar-right">
				    	<li class="dropdown">
					        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" 
					        aria-expanded="false" style="padding-right: 60px;">MY ACCOUNT</a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					          <a class="dropdown-item active" href="logoutAction.jsp">SIGN OUT</a>
					        </div>
				       </li>
					</ul>				    	
		    		    		
		    <% 		
		    	}
		    %>		    
		    

		  </div>
		</nav>
		
		<div class="container">
			<div class="space"></div>
			<div class="row">	
				<table class="table table-striped" style="text-align: center; boreder: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center; width: 10%;">NO.</th>
							<th style="background-color: #eeeeee; text-align: center; width: 45%;">Title</th>
							<th style="background-color: #eeeeee; text-align: center; width: 20%;">Name</th>
							<th style="background-color: #eeeeee; text-align: center; width: 25%;">Date</th>
						</tr>
					</thead>
					<tbody>
					
						<%
							BbsDao bbsDao = new BbsDao();
							ArrayList<Bbs> list = bbsDao.getList(pageNumber);
							for(int i=0; i<list.size(); i++){
						%>			
							<tr>
								<td><%= list.get(i).getBbsID()%></td>
								<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></a></td>
								<td><%= list.get(i).getUserID()%></td>
								<td>2<%= list.get(i).getBbsDate().substring(1,11) + 
								list.get(i).getBbsDate().substring(11,13) + ":" +list.get(i).getBbsDate().substring(14,16)%></td>													
							</tr>							
						
						<%										
							}
						%>							

					</tbody>
				</table>
				<% 
					if(pageNumber != 1){
				%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-success btn-arow-left">이전</a>
				
				<% 		
					} if(bbsDao.nextPage(pageNumber + 1)){
				%>		
					<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a> 	
						
				<% 		
					}
				
				%>
				
				
				<a href="write.jsp" class="btn btn-primary pull-right">Write</a>
				

			</div>
			
		
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
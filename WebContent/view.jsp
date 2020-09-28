<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>   
 <%@ page import="bbs.Bbs" %>
  <%@ page import="bbs.BbsDao" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="vieport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/custom.css">
<title>BULLETIN BOARD </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('This post is not valid')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");			
		}
		Bbs bbs = new BbsDao().getBbs(bbsID);
	
	%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="index.jsp">BULLETIN BOARD </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item ">
		        <a class="nav-link" href="main.jsp">Main <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="bbs.jsp">Bulletin Board</a>
		      </li>
		    </ul>
		    <%
		    	if(userID == null){
		    %>
				    <ul class="nav navbar-nav navbar-right">
				    	<li class="dropdown">
					        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" 
					        aria-expanded="false" style="padding-right: 60px;">SING IN</a>
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
					        aria-expanded="false" style="padding-right: 60px;">My Account</a>
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
			<div class="row">
					<table class="table table-striped" style="text-align: center; boreder: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align: center:">View post</th>
	
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%;">Title</td>
								<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>
							</tr>	
							<tr>
								<td>Name</td>
								<td colspan="2"><%= bbs.getUserID() %></td>
							</tr>	
							<tr>
								<td>Date</td>
								<td colspan="2">2<%= bbs.getBbsDate().substring(1,11) + 
										bbs.getBbsDate().substring(11,13) + ":" +bbs.getBbsDate().substring(14,16) %></td>
							</tr>			
							<tr>
								<td>Content</td>
								<td colspan="2" style="min-height: 200px; text-align: left;">
								<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
							</tr>								
																			
						</tbody>
					</table>			
					<a href="bbs.jsp" class="btn btn-primary">List</a>	
					<%
						if(userID !=null && userID.equals(bbs.getUserID())){
					%>
							<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">Edit</a>
							<a onclick="return confirm('Do you want to delete the post?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">Delete</a>		
					<%		
						}
					
					%>
			</div>
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
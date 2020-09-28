<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>   
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
				<form method="post" action="writeAction.jsp">
					<table class="table table-striped" style="text-align: center; boreder: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center:">Write a post</th>
	
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="Title" name="bbsTitle" maxlength="50"></td>
							</tr>	
							<tr>
								<td><textarea class="form-control" placeholder="Content" name="bbsContent" maxlength="2048"
								style="height : 350px;"></textarea></td>								
							</tr>
						</tbody>
					</table>				
					<input type="submit"  class="btn btn-primary pull-right" value="Write">
				</form>	
			</div>
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
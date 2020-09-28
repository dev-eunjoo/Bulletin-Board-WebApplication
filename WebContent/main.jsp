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
		  <a class="navbar-brand" href="#">BULLETIN BOARD </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link active" href="main.jsp">Main <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
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
	      
	      <div class="container introduce" style="padding-top:0px;">
			<div class="jumbotron" style="margin-top:110px;">
					<h1>BULLETIN BOARD </h1><br>
					<p style="font-size:20px;">This Web Application has a log-in system. Users must register the  and sign in.<br>
					After sign in, the user can write or delete posts on the bulletin board.<br>  
					I created this Web Application with JSP, Java, MySql, JavaScript, Bootstrap using eclipse.<br> <br> 
					Feel free to share your thought! Enjoy! <br> <br> 
					***************************************<br> 
					For the testing, you can use the account below.<br> 
					ID : eunjoo<br> 
					Password : 12345<br> 
					****************************************<br>  
					</p><br>
					<a class="btn btn-primary btn-pull" href="bbs.jsp" role="button">Bulletin Board</a>
			</div>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
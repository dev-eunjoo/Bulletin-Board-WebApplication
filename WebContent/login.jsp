<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="index.jsp">BULLETIN BOARD </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item ">
		        <a class="nav-link" href="#">Main<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="bbs.jsp">Bulletin Board </a>
		      </li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		    	<li class="dropdown">
			        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-right: 60px;">
	          SIGN IN</a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item active"  href="login.jsp" >SIGN IN</a>
			          <a class="dropdown-item" href="join.jsp">JOIN</a>
			        </div>
		       </li>
			</ul>
		  </div>
		</nav>
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="loginAction.jsp">
						<h3 style="text-align: center; margin-top:25px;">SIGN IN</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Password" name="userPassword" maxlength="20">
						</div>
						<div class="form-group" style="text-align:center;">
							<input type="submit" class="btn btn-primary btn-block" value="Sign in">						
						</div>		
					</form>
			
				</div>
			
			</div>
		
		</div>
	    

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
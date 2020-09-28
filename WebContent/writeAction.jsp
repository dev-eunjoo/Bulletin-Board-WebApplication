<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDao" %>
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> 
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">

<title>BULLETIN BOARD </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please log in first')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else{
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('Complete all required fields')");
						script.println("history.back()");
						script.println("</script>");
					} else{
						BbsDao bbsDAO = new BbsDao();
						int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
						if(result == - 1){   
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('You failed to write the post')");
							script.println("history.back()");
							script.println("</script>");
						}
						else if(result == 1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
						}			
			}
	
		}

	%>
</body>
</html>